# Clean build directory
rm -rf build/*

# Export release info
git rev-parse --short HEAD > loveapp/release.txt

# Build .love
cd loveapp
zip -r ../build/desertloot.love *

cd ../build

# build Windows
cp -R ../love-windows ./desertloot-win
cat ./desertloot-win/love.exe ./desertloot.love > ./desertloot-win/desertloot.exe
rm ./desertloot-win/love.exe

# Build Mac

cp -R /Applications/love.app ../build/Desert\ Loot.app
cp ./desertloot.love ./Desert\ Loot.app/Contents/Resources/
/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier org.gloryfish.Desert\ Loot" ./Desert\ Loot.app/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleName Desert Loot" ./Desert\ Loot.app/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleSignature org.gloryfish.Desert\ Loot" ./Desert\ Loot.app/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Delete :UTExportedTypeDeclarations" ./Desert\ Loot.app/Contents/Info.plist
/usr/libexec/PlistBuddy -c "Delete :CFBundleDocumentTypes" ./Desert\ Loot.app/Contents/Info.plist

cp ../icon.icns ./Desert\ Loot.app/Contents/Resources/Love.icns