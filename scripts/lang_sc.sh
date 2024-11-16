#!/usr/bin/env bash

function main() {
    
    source "sharedFuncs.sh"

    load_paths
    WINE_PREFIX="$SCR_PATH/prefix"

    #resources will be remove after installation
    RESOURCES_PATH="$SCR_PATH/resources"

    check_ps_installed
    
    export_var

    FONT_PATH="$WINE_PREFIX/drive_c/windows/Fonts/"
    LOCALE_PATH="$WINE_PREFIX/drive_c/users/$USER/PhotoshopSE/Locales/"
    
    echo "Copying fonts..."
    ls $FONT_PATH
    cp -r ../patch/fonts/* "$FONT_PATH"
    wine regedit "../patch/fonts/chn_font.reg"

    echo "Copying UI locales..."
    cp -r ../patch/Locales/* "$LOCALE_PATH"

    echo "Done"

    echo "接下来：启动Photoshop后，在首选项中设置界面语言为简体中文（Simplified Chinese）。"
}


function check_ps_installed() {
    ([ -d "$SCR_PATH" ] && [ -d "$CACHE_PATH" ] && [ -d "$WINE_PREFIX" ] && show_message2 "photoshop installed") || error2 "photoshop not found you should intsall photoshop first"
}


main
