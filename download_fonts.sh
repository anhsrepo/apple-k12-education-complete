#!/bin/bash

# Download Apple icon fonts
echo "Downloading Apple icon fonts..."
curl -s "https://www.apple.com/ac/globalfooter/8/en_US/assets/ac-footer/legacy/appleicons_text.woff" > assets/ac-footer/legacy/appleicons_text.woff
curl -s "https://www.apple.com/ac/globalfooter/8/en_US/assets/ac-footer/legacy/appleicons_thin.woff" > assets/ac-footer/legacy/appleicons_thin.woff
curl -s "https://www.apple.com/ac/globalfooter/8/en_US/assets/ac-footer/legacy/appleicons_ultralight.woff" > assets/ac-footer/legacy/appleicons_ultralight.woff

# Download buystrip icons
echo "Downloading buystrip icons..."
curl -s "https://www.apple.com/ac/globalfooter/8/en_US/assets/ac-buystrip/bag/icon_large.svg" > assets/ac-buystrip/bag/icon_large.svg
curl -s "https://www.apple.com/ac/globalfooter/8/en_US/assets/ac-buystrip/bag/icon_dark_large.svg" > assets/ac-buystrip/bag/icon_dark_large.svg

echo "Font download complete!"