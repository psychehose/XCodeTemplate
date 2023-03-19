#!/usr/bin/env sh

# Configuration
XCODE_TEMPLATE_DIR=$HOME'/Library/Developer/Xcode/Templates/File Templates/YourTemplate'
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy RIBs file templates into the local RIBs template directory
xcodeTemplate () {
  echo "==> Copying up Xcode file templates..."

  if [ -d "$XCODE_TEMPLATE_DIR" ]; then
    rm -R "$XCODE_TEMPLATE_DIR"
  fi
  mkdir -p "$XCODE_TEMPLATE_DIR"

  cp -R $SCRIPT_DIR/../YourTemplate/PublicRIBs.xctemplate "$XCODE_TEMPLATE_DIR"
  #cp -R $SCRIPT_DIR/RIB.xctemplate/ownsView/* "$XCODE_TEMPLATE_DIR/RIB.xctemplate/ownsViewwithXIB/"
  #cp -R $SCRIPT_DIR/RIB.xctemplate/ownsView/* "$XCODE_TEMPLATE_DIR/RIB.xctemplate/ownsViewwithStoryboard/"
}

xcodeTemplate

echo "==> ... success!"
echo "==> Template have been se up. In Xcode, select 'New File...' to use templates."
