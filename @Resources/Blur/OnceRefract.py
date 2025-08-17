import winreg
import cv2
import os
import tempfile
import ctypes
import shutil
import numpy as np
from PIL import Image, ImageFilter, ImageDraw, ImageEnhance
import argparse
import re
from ctypes import windll, wintypes, byref

wallpath1 = os.path.expandvars(r'%USERPROFILE%\Documents\Rainmeter\Skins\BigSur\@Resources\Blur') 
LAST_WALLPAPER_FILE = os.path.join(wallpath1, "last_wallpaper.txt")
ORIGINAL_WALLPAPER = os.path.join(wallpath1, "original_wallpaper.jpg")

def get_current_wallpaper():
    reg_key = r'Control Panel\Desktop'
    with winreg.OpenKey(winreg.HKEY_CURRENT_USER, reg_key) as key:
        wallpaper_path, _ = winreg.QueryValueEx(key, 'WallPaper')
        return wallpaper_path

def get_screen_metrics():
    user32 = ctypes.windll.user32
    user32.SetProcessDPIAware()  # Handles DPI scaling

    screen_width = user32.GetSystemMetrics(0)
    screen_height = user32.GetSystemMetrics(1)

    workarea = wintypes.RECT()
    ctypes.windll.user32.SystemParametersInfoW(0x0030, 0, ctypes.byref(workarea), 0)  # SPI_GETWORKAREA
    work_width = workarea.right - workarea.left
    work_height = workarea.bottom - workarea.top

    return {
        "#ScreenAreaWidth#": screen_width,
        "#ScreenAreaHeight#": screen_height,
        "#workareawidth#": work_width,
        "#workareaheight#": work_height
    }

def safe_eval(expr, variables):
    for var, value in variables.items():
        expr = re.sub(re.escape(var), str(value), expr, flags=re.IGNORECASE)

    try:
        return int(eval(expr, {"__builtins__": None}, {}))
    except Exception as e:
        print(f"Could not evaluate expression '{expr}': {e}")
        return 0
def get_screen_resolution():
    user32 = ctypes.windll.user32
    return user32.GetSystemMetrics(0), user32.GetSystemMetrics(1)  # width, height

def get_rocketdock_blur_region(padding=3):
    try:
        # Read main RocketDock registry values
        rk = winreg.OpenKey(winreg.HKEY_CURRENT_USER, r"Software\RocketDock")
        icon_min = int(winreg.QueryValueEx(rk, "IconMin")[0])
        v_offset = int(winreg.QueryValueEx(rk, "vOffset")[0])
        offset = int(winreg.QueryValueEx(rk, "Offset")[0])
        side = int(winreg.QueryValueEx(rk, "Side")[0])
        autohide = int(winreg.QueryValueEx(rk, "AutoHide")[0])
        winreg.CloseKey(rk)

        # Exit early if AutoHide is enabled
        if autohide != 0:
            return None

        # Read icon count and check for separators
        rk_icons = winreg.OpenKey(winreg.HKEY_CURRENT_USER, r"Software\RocketDock\Icons")
        count = int(winreg.QueryValueEx(rk_icons, "Count")[0])

        ignore_count = 0
        for i in range(count):
            try:
                val = winreg.QueryValueEx(rk_icons, f"{i}-IsSeparator")[0]
                if int(val) == 1:
                    ignore_count += 1
            except FileNotFoundError:
                continue  # Key not present → not a separator

        winreg.CloseKey(rk_icons)

        # Calculate screen resolution
        screen_width, screen_height = get_screen_resolution()

        # Compute Width & Height
        width = ((count - ignore_count) * icon_min) + (padding * 2) + (ignore_count * icon_min / 2)
        height = icon_min + (padding * 2)
        v_offset_pixels = v_offset
        offset_pixels = offset
        # Determine x, y, w, h based on Side
        if side == 0:  # Bottom
            x = (screen_width / 2) - (width / 2)
            y = v_offset_pixels + padding
            w, h = width, height
        elif side == 1:  # Top
            x = (screen_width / 2) - (width / 2)
            y = screen_height - height - v_offset_pixels - padding
            w, h = width, height
        elif side == 2:  # Left
            x = v_offset_pixels + (padding / 2)
            y = (screen_height / 2) - (width / 2) - offset_pixels
            w, h = height, width
        elif side == 3:  # Right
            x = screen_width - height - v_offset_pixels
            y = (screen_height / 2) - (width / 2) - offset_pixels
            w, h = height, width
        else:
            return None  # Unknown side

        return int(x), int(y), int(w), int(h)

    except Exception as e:
        print(f"RocketDock parsing error: {e}")
        return None
        
def parse_rainmeter_ini(ini_path, padding=0, dpi=1):
    import codecs

    regions = []
    size_by_active = {
        '1': (int(150*dpi), int(150*dpi)),
        '2': (int(320*dpi), int(150*dpi)),
        '3': (int(63*dpi), int(60*dpi)),
        '4': (int(320*dpi), int(330*dpi)),
        '5': (int(150*dpi), int(150*dpi)),
        '6': (int(150*dpi), int(150*dpi)),
        '7': (int(150*dpi), int(150*dpi)),
        '8': (int(150*dpi), int(150*dpi)),
        '9': (int(150*dpi), int(150*dpi)),
        '10': (int(150*dpi), int(150*dpi)),
        '11': (int(150*dpi), int(150*dpi)),
        '12': (int(150*dpi), int(150*dpi))
    }
    size_by_active_shortcut = {
        '1': (int(150*dpi), int(150*dpi)),
        '2': (int(80*dpi), int(80*dpi)),
        '3': (int(63*dpi), int(60*dpi)),
    }
    size_by_multi = {
        '1': (int(320*dpi), int(150*dpi)),
        '2': (int(320*dpi), int(150*dpi)),
        '3': (int(320*dpi), int(150*dpi)),
        '4': (int(320*dpi), int(150*dpi)),
        '5': (int(150*dpi), int(150*dpi)),
        '6': (int(150*dpi), int(150*dpi)),
        '7': (int(320*dpi), int(150*dpi)),
        '8': (int(320*dpi), int(150*dpi)),
        '9': (int(320*dpi), int(150*dpi))
    }
    with open(ini_path, 'rb') as f:
        raw = f.read()

    if raw.startswith(codecs.BOM_UTF8):
        content = raw.decode('utf-8-sig')
    elif raw.startswith(codecs.BOM_UTF16_LE):
        content = raw.decode('utf-16-le')
    elif raw.startswith(codecs.BOM_UTF16_BE):
        content = raw.decode('utf-16-be')
    else:
        content = raw.decode('utf-8', errors='replace')

    variables = get_screen_metrics()
    section_pattern = re.compile(r'\[\s*([^\]]+?)\s*\](.*?)((?=\n\[)|\Z)', re.S | re.M | re.I)
    #regions.append(get_rocketdock_blur_region())
    #regions.append((0,0,1920,30))
    for match in section_pattern.finditer(content):
        section_name, body, _ = match.groups()

        # Filter by section name keywords: "Widget" or "Shortcut"
        if not re.search(r'widget|shortcut', section_name, re.I):
            continue

        active_match = re.search(r'Active\s*=\s*(\d+)', body, re.I)
        if not active_match:
            continue

        active = active_match.group(1)
        if active not in size_by_active:
            continue

        windowx_match = re.search(r'WindowX\s*=\s*(.+)', body, re.I)
        windowy_match = re.search(r'WindowY\s*=\s*(.+)', body, re.I)
        if not windowx_match or not windowy_match:
            continue

        x_expr = windowx_match.group(1).strip()
        y_expr = windowy_match.group(1).strip()
        padding = ((10 - padding) * int(dpi))
        x = safe_eval(x_expr, variables) + padding 
        y = safe_eval(y_expr, variables) + padding
        if re.search(r'widget', section_name, re.I):
            w, h = size_by_active[active]
        if re.search(r'MultiDouble', section_name, re.I):
            w, h = size_by_multi[active]
        if re.search(r'shortcut', section_name, re.I):
            w, h = size_by_active_shortcut[active]
            if re.search(r'Active\s*=2', body, re.I):
                x = safe_eval(x_expr, variables) + padding + 30
                y = safe_eval(y_expr, variables) + padding + 30
        regions.append((x, y, w, h))

    return regions

def create_rounded_mask(size, radius):
    w, h = size
    mask = Image.new('L', (w, h), 0)
    draw = ImageDraw.Draw(mask)
    draw.rounded_rectangle((0, 0, w, h), radius=radius, fill=255)
    return mask

def blur_regions_with_rounding2(image, regions, blur_radius=15, corner_radius=20):
    for (x, y, w, h) in regions:
        region_box = (x, y, x + w, y + h)
        cropped = image.crop(region_box)
        blurred = cropped.filter(ImageFilter.GaussianBlur(radius=blur_radius))

        mask = create_rounded_mask((w, h), radius=corner_radius)

        composite = Image.composite(blurred, cropped, mask)
        image.paste(composite, (x, y))

    return image

import cv2
import numpy as np
from PIL import Image, ImageDraw

def blur_regions_with_rounding(
    image,
    regions,
    blur_radius=3,
    corner_radius=25,
    magnification=1.55,
    distortion_strength=60,
    edge_falloff=1.5,
    contrast=1.5,
    overlay_color=(0, 0, 0, 10)  # e.g., (255, 255, 255, 80)
):
    """
    Apply refractive distortion + optional blur, contrast, and overlay to rounded rectangle regions.

    Parameters:
    - image: PIL.Image (RGB)
    - regions: list of (x, y, w, h) tuples
    - blur_radius: Gaussian blur strength
    - corner_radius: rounding of the rectangle
    - magnification: zoom factor for refraction
    - distortion_strength: how much to warp the background
    - edge_falloff: exponent controlling softness of distortion at edges
    - contrast: contrast multiplier (1.0 = no change)
    - overlay_color: RGBA color to blend on top (alpha in 0–255)
    """
    img_np = np.array(image)

    for (x, y, w, h) in regions:
        x, y = max(0, x), max(0, y)
        w, h = min(w, img_np.shape[1] - x), min(h, img_np.shape[0] - y)
        region = img_np[y:y+h, x:x+w].copy()

        # Normalized grid
        yy, xx = np.meshgrid(np.linspace(-1, 1, h), np.linspace(-1, 1, w), indexing='ij')
        r = np.sqrt(xx**2 + yy**2)
        falloff = np.clip(1 - r**edge_falloff, 0, 1)

        disp_x = -xx * distortion_strength * falloff
        disp_y = -yy * distortion_strength * falloff
        scale_x = (xx * magnification)
        scale_y = (yy * magnification)

        map_x = ((scale_x + 1) * (w - 1) / 2 + disp_x).astype(np.float32)
        map_y = ((scale_y + 1) * (h - 1) / 2 + disp_y).astype(np.float32)

        distorted = cv2.remap(region, map_x, map_y, interpolation=cv2.INTER_LINEAR, borderMode=cv2.BORDER_REFLECT)

        # Convert to PIL for optional adjustments
        distorted_pil = Image.fromarray(distorted)

        # Apply contrast adjustment
        if contrast != 1.0:
            enhancer = ImageEnhance.Contrast(distorted_pil)
            distorted_pil = enhancer.enhance(contrast)

        # Apply Gaussian blur
        if blur_radius > 0:
            distorted_pil = distorted_pil.filter(ImageFilter.GaussianBlur(radius=blur_radius))

        # Apply RGBA overlay
        if overlay_color and isinstance(overlay_color, (tuple, list)) and len(overlay_color) == 4:
            overlay = Image.new("RGBA", (w, h), overlay_color)
            distorted_pil = Image.alpha_composite(distorted_pil.convert("RGBA"), overlay)

        distorted_np = np.array(distorted_pil.convert("RGB"))

        # Rounded mask
        mask_img = Image.new("L", (w, h), 0)
        draw = ImageDraw.Draw(mask_img)
        draw.rounded_rectangle((0, 0, w, h), radius=corner_radius, fill=255)
        mask_np = np.array(mask_img) / 255.0

        for c in range(3):
            img_np[y:y+h, x:x+w, c] = (
                distorted_np[:, :, c] * mask_np + img_np[y:y+h, x:x+w, c] * (1 - mask_np)
            )

    return Image.fromarray(img_np)

def set_wallpaper(image_path):
    SPI_SETDESKWALLPAPER = 20
    ctypes.windll.user32.SystemParametersInfoW(SPI_SETDESKWALLPAPER, 0, image_path, 3)
    # set_reg('MouseSensitivity', str(10))
    
def save_last_wallpaper(path):
    with open(LAST_WALLPAPER_FILE, 'w') as f:
        f.write(path)

def get_last_wallpaper():
    if os.path.exists(LAST_WALLPAPER_FILE):
        with open(LAST_WALLPAPER_FILE, 'r') as f:
            return f.read().strip()
    return None
    
def ensure_original_wallpaper():
    wallpaper_path = get_current_wallpaper()
    blurred_wallpaper_name = os.path.join(tempfile.gettempdir(), "blurred_wallpaper.jpg")

    # If the current wallpaper is the *blurred* one we generated, get the *real* one from last_wallpaper.txt
    if wallpaper_path == blurred_wallpaper_name:
        wallpaper_path = get_last_wallpaper()

    last_wallpaper = get_last_wallpaper()
    if wallpaper_path != last_wallpaper or not os.path.exists(ORIGINAL_WALLPAPER):
        print("New original wallpaper detected or missing original, copying...")
        print(ORIGINAL_WALLPAPER)
        shutil.copy2(wallpaper_path, ORIGINAL_WALLPAPER)
        save_last_wallpaper(wallpaper_path)
    return ORIGINAL_WALLPAPER
    
    
def main():
    parser = argparse.ArgumentParser(description="Blur Rainmeter Widgets/Shortcuts on wallpaper with rounded corners.")
    parser.add_argument('--padding', type=int, default=10, help="Padding in pixels to adjust blur regions position.")
    parser.add_argument('--blur', type=int, default=15, help="Blur radius.")
    parser.add_argument('--radius', type=int, default=25, help="Corner radius for rounded blur regions.")
    parser.add_argument('--dpi', type=float, default=1, help="Corner radius for rounded blur regions.")
    parser.add_argument('--path', type=str, default=r'%USERPROFILE%\Documents\Rainmeter\Skins\BirSur\@Resources\Blur\original_wallpaper.jpg', help="Path of the Blur folder for making a backup of the wallpaper")
    args = parser.parse_args()

    wallpaper_path = get_current_wallpaper()
    if not os.path.exists(wallpaper_path):
        print(f"Wallpaper not found at {wallpaper_path}")
        return

    rainmeter_ini = os.path.expandvars(r"%AppData%\Rainmeter\Rainmeter.ini")
    if not os.path.exists(rainmeter_ini):
        print(f"Rainmeter.ini not found at {rainmeter_ini}")
        return

    regions = parse_rainmeter_ini(rainmeter_ini, padding=args.padding, dpi=args.dpi)
    if not regions:
        print("No matching active Rainmeter Widgets/Shortcuts found.")
        return

    script_dir = os.path.dirname(os.path.abspath(__file__))
    backup_path = os.path.join(script_dir, "original_wallpaper.jpg")
    wallpath1 = os.path.expandvars(r'%USERPROFILE%\Documents\Rainmeter\Skins\BigSur\@Resources\Blur') 
    wallpath = os.path.join(wallpath1, os.path.basename(wallpaper_path))


    screen_size = (get_screen_metrics()["#ScreenAreaWidth#"], get_screen_metrics()["#ScreenAreaHeight#"])
    image = Image.open(ORIGINAL_WALLPAPER).convert("RGB")
    if image.size != screen_size:
        image = image.resize(screen_size, Image.LANCZOS)

    image = blur_regions_with_rounding(image, regions, corner_radius=args.radius)

    image.save("refracted_output.png")
    temp_dir = tempfile.gettempdir()
    new_wallpaper_path = os.path.join(temp_dir, "blurred_wallpaper.jpg")
    image.save(new_wallpaper_path, "JPEG")

    set_wallpaper(new_wallpaper_path)
    print(f"Wallpaper updated: {new_wallpaper_path}")

if __name__ == "__main__":
    ensure_original_wallpaper()
    main()
