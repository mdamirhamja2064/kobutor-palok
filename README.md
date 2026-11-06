# কবুতর পালক v3.0 - APK বানানোর নির্দেশনা

## GitHub-এ আপলোড (সব ফাইল ও ফোল্ডার একসাথে)
`www/`, `assets/`, `scripts/`, `.github/`, `package.json`, `capacitor.config.json`, `README.md`

- Add file → Upload files → ফোল্ডারসহ টেনে ফেলুন → Commit changes
- `.github/workflows/build-apk.yml` আছে কিনা দেখে নিন।
- ফোল্ডার আপলোড না হলে Add file → Create new file দিয়ে নাম লিখুন (যেমন `scripts/build-vendor.sh`)।

## APK নামানো
Actions ট্যাবে সবুজ টিক এলে (৫-১০ মিনিট) Releases থেকে `kobutor-palok.apk` নামান।

## আপডেটের আগে
অ্যাপ → সেটিংস থেকে "ফুল ব্যাকআপ" নিয়ে রাখুন। নতুন APK আগেরটার ওপর ইনস্টল করলে ডেটা থাকে।
