#!/bin/sh

# このスクリプトは、SteamCMDを使って、Palworldのゲームサーバーを更新します。

echo "現在のバージョンを確認します。"
date
OLD_BUILD_ID=`steamcmd +login anonymous +app_status 2394010 +quit | grep -e "BuildID" | awk '{print $8}'`
echo "現在のビルドID: $OLD_BUILD_ID"

echo "サーバーの更新を開始します。"
steamcmd +login anonymous +app_update 2394010 validate +quit > /dev/null

echo "更新後のバージョンを確認します。"
NEW_BUILD_ID=`steamcmd +login anonymous +app_status 2394010 +quit | grep -e "BuildID" | awk '{print $8}'`
echo "更新後のBuildID: $NEW_BUILD_ID"

# バージョンが変わったかどうかを確認する
if [ $OLD_BUILD_ID = $NEW_BUILD_ID ]; then
    # バージョンが変わらなかった場合の処理
    echo "バージョンは変わりませんでした"
else
    # バージョンが変わった場合の処理
    echo "バージョンが変わりました"
fi
