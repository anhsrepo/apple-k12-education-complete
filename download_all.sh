#!/bin/bash

# Create directory structure
mkdir -p styles scripts assets/images assets/fonts assets/json pages

# Download main HTML
echo "Downloading main HTML page..."
curl -s "https://www.apple.com/education/k12/deploy-and-manage/" > pages/index.html

# Download CSS files
echo -e "\nDownloading CSS files..."
curl -s "https://www.apple.com/ac/ac-films/6.8.2/styles/modal.css" > styles/modal.css
curl -s "https://www.apple.com/ac/globalfooter/8/en_US/styles/ac-globalfooter.built.css" > styles/ac-globalfooter.built.css
curl -s "https://www.apple.com/ac/localnav/9/styles/ac-localnav.built.css" > styles/ac-localnav.built.css
curl -s "https://www.apple.com/api-www/global-elements/global-header/v1/assets/globalheader.css" > styles/globalheader.css
curl -s "https://www.apple.com/v/education/k12/home/ag/built/styles/deploy-and-manage.built.css" > styles/deploy-and-manage.built.css
curl -s "https://www.apple.com/v/education/k12/home/ag/built/styles/main.built.css" > styles/main.built.css
curl -s "https://www.apple.com/v/markets-shared-form/a/built/styles/main.built.css" > styles/markets-shared-form.built.css

# Download JavaScript files
echo -e "\nDownloading JavaScript files..."
curl -s "https://www.apple.com/ac/ac-films/6.8.2/scripts/autofilms.built.js" > scripts/autofilms.built.js
curl -s "https://www.apple.com/ac/globalfooter/8/en_US/scripts/ac-globalfooter.built.js" > scripts/ac-globalfooter.built.js
curl -s "https://www.apple.com/ac/localeswitcher/4/en_US/scripts/localeswitcher.built.js" > scripts/localeswitcher.built.js
curl -s "https://www.apple.com/ac/localnav/9/scripts/ac-localnav.built.js" > scripts/ac-localnav.built.js
curl -s "https://www.apple.com/api-www/global-elements/global-header/v1/assets/globalheader.umd.js" > scripts/globalheader.umd.js
curl -s "https://www.apple.com/metrics/ac-analytics/2.25.0/scripts/ac-analytics.js" > scripts/ac-analytics.js
curl -s "https://www.apple.com/metrics/ac-analytics/2.25.0/scripts/auto-init.js" > scripts/auto-init.js
curl -s "https://www.apple.com/v/education/k12/home/ag/built/scripts/head.built.js" > scripts/head.built.js
curl -s "https://www.apple.com/v/education/k12/home/ag/built/scripts/main.built.js" > scripts/main.built.js

# Download images
echo -e "\nDownloading images..."
curl -s "https://www.apple.com/v/education/k12/home/ag/images/deploy-and-manage/hero__bdrr6j8wm23m_xlarge.jpg" > assets/images/hero__bdrr6j8wm23m_xlarge.jpg
curl -s "https://www.apple.com/v/education/k12/home/ag/images/deploy-and-manage/zero__bdv6fylzg9jm_large.jpg" > assets/images/zero__bdv6fylzg9jm_large.jpg
curl -s "https://www.apple.com/v/education/k12/home/ag/images/deploy-and-manage/icon_user__dcdg5qf4g9f6_large.jpg" > assets/images/icon_user__dcdg5qf4g9f6_large.jpg
curl -s "https://www.apple.com/v/education/k12/home/ag/images/deploy-and-manage/icon_lock__bgw2p9qjdlv6_large.jpg" > assets/images/icon_lock__bgw2p9qjdlv6_large.jpg
curl -s "https://www.apple.com/v/education/k12/home/ag/images/deploy-and-manage/icon_check__dxb8v6z31wk2_large.jpg" > assets/images/icon_check__dxb8v6z31wk2_large.jpg
curl -s "https://www.apple.com/v/education/k12/home/ag/images/deploy-and-manage/icon_multi_profile__bxtkqh7msmye_large.jpg" > assets/images/icon_multi_profile__bxtkqh7msmye_large.jpg
curl -s "https://www.apple.com/v/education/k12/home/ag/images/deploy-and-manage/icon_login__be2o12tdwk3m_large.jpg" > assets/images/icon_login__be2o12tdwk3m_large.jpg
curl -s "https://www.apple.com/v/education/k12/home/ag/images/deploy-and-manage/icon_mobile_device__dxdzkbnkfvgm_large.jpg" > assets/images/icon_mobile_device__dxdzkbnkfvgm_large.jpg
curl -s "https://www.apple.com/v/education/k12/home/ag/images/deploy-and-manage/icon_app_store__dywz78jxzua6_large.jpg" > assets/images/icon_app_store__dywz78jxzua6_large.jpg
curl -s "https://www.apple.com/v/education/k12/home/ag/images/deploy-and-manage/icon_money__oqfm7xtcnwai_large.jpg" > assets/images/icon_money__oqfm7xtcnwai_large.jpg
curl -s "https://www.apple.com/v/education/k12/home/ag/images/deploy-and-manage/icon_books_school__cb5aozadyiqu_large.jpg" > assets/images/icon_books_school__cb5aozadyiqu_large.jpg

echo -e "\nDownload complete!"