#!/usr/bin/env python3
import os
import re
import requests
from urllib.parse import urljoin, urlparse
from pathlib import Path
import json

# Base URL for Apple site
BASE_URL = "https://www.apple.com"
PAGE_URL = "https://www.apple.com/education/k12/deploy-and-manage/"

# Create directory structure
directories = [
    "styles",
    "scripts",
    "assets/images",
    "assets/fonts",
    "assets/json",
    "pages"
]

for dir in directories:
    Path(dir).mkdir(parents=True, exist_ok=True)

# CSS Files to download
css_files = [
    "/ac/ac-films/6.8.2/styles/modal.css",
    "/ac/globalfooter/8/en_US/styles/ac-globalfooter.built.css",
    "/ac/localnav/9/styles/ac-localnav.built.css",
    "/api-www/global-elements/global-header/v1/assets/globalheader.css",
    "/v/education/k12/home/ag/built/styles/deploy-and-manage.built.css",
    "/v/education/k12/home/ag/built/styles/main.built.css",
    "/v/markets-shared-form/a/built/styles/main.built.css"
]

# JavaScript Files to download
js_files = [
    "/ac/ac-films/6.8.2/scripts/autofilms.built.js",
    "/ac/globalfooter/8/en_US/scripts/ac-globalfooter.built.js",
    "/ac/localeswitcher/4/en_US/scripts/localeswitcher.built.js",
    "/ac/localnav/9/scripts/ac-localnav.built.js",
    "/api-www/global-elements/global-header/v1/assets/globalheader.umd.js",
    "/metrics/ac-analytics/2.25.0/scripts/ac-analytics.js",
    "/metrics/ac-analytics/2.25.0/scripts/auto-init.js",
    "/v/education/k12/home/ag/built/scripts/head.built.js",
    "/v/education/k12/home/ag/built/scripts/main.built.js"
]

# Images found in the page
images = [
    "/v/education/k12/home/ag/images/deploy-and-manage/hero__bdrr6j8wm23m_xlarge.jpg",
    "/v/education/k12/home/ag/images/deploy-and-manage/zero__bdv6fylzg9jm_large.jpg",
    "/v/education/k12/home/ag/images/deploy-and-manage/icon_user__dcdg5qf4g9f6_large.jpg",
    "/v/education/k12/home/ag/images/deploy-and-manage/icon_lock__bgw2p9qjdlv6_large.jpg",
    "/v/education/k12/home/ag/images/deploy-and-manage/icon_check__dxb8v6z31wk2_large.jpg",
    "/v/education/k12/home/ag/images/deploy-and-manage/icon_multi_profile__bxtkqh7msmye_large.jpg",
    "/v/education/k12/home/ag/images/deploy-and-manage/icon_login__be2o12tdwk3m_large.jpg",
    "/v/education/k12/home/ag/images/deploy-and-manage/icon_mobile_device__dxdzkbnkfvgm_large.jpg",
    "/v/education/k12/home/ag/images/deploy-and-manage/icon_app_store__dywz78jxzua6_large.jpg",
    "/v/education/k12/home/ag/images/deploy-and-manage/icon_money__oqfm7xtcnwai_large.jpg",
    "/v/education/k12/home/ag/images/deploy-and-manage/icon_books_school__cb5aozadyiqu_large.jpg"
]

def download_file(url, destination):
    """Download a file from URL to destination"""
    full_url = urljoin(BASE_URL, url)
    try:
        response = requests.get(full_url, timeout=30)
        response.raise_for_status()
        
        # Ensure directory exists
        os.makedirs(os.path.dirname(destination), exist_ok=True)
        
        with open(destination, 'wb') as f:
            f.write(response.content)
        print(f"Downloaded: {destination}")
        return True
    except Exception as e:
        print(f"Failed to download {full_url}: {e}")
        return False

def extract_additional_resources(content):
    """Extract additional resources from CSS/JS content"""
    resources = []
    
    # Find URLs in CSS (for fonts, images, etc)
    url_pattern = r'url\(["\']?([^"\')]+)["\']?\)'
    urls = re.findall(url_pattern, content)
    
    # Find import statements
    import_pattern = r'@import\s+["\']([^"\']+)["\']'
    imports = re.findall(import_pattern, content)
    
    resources.extend(urls)
    resources.extend(imports)
    
    return resources

# Download main HTML
print("Downloading main HTML page...")
response = requests.get(PAGE_URL)
with open("pages/index.html", 'w', encoding='utf-8') as f:
    f.write(response.text)

# Download CSS files
print("\nDownloading CSS files...")
for css in css_files:
    filename = os.path.basename(css)
    download_file(css, f"styles/{filename}")

# Download JavaScript files
print("\nDownloading JavaScript files...")
for js in js_files:
    filename = os.path.basename(js)
    download_file(js, f"scripts/{filename}")

# Download images
print("\nDownloading images...")
for img in images:
    filename = os.path.basename(img)
    download_file(img, f"assets/images/{filename}")

# Create resource manifest
manifest = {
    "page_url": PAGE_URL,
    "css_files": css_files,
    "js_files": js_files,
    "images": images,
    "directories": directories
}

with open("assets/json/resource_manifest.json", 'w') as f:
    json.dump(manifest, f, indent=2)

print("\nResource download complete!")
print("Check resource_manifest.json for a complete list of downloaded files.")