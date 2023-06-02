curl -Ls https://install.tuist.io | bash
tuist install 3.20.0
tuist fetch
tuist generate
xcodebuild clean -quiet
xcodebuild build-for-testing\
    -workspace 'Sipper.xcworkspace' \
    -scheme 'Sipper' \
    -destination 'platform=iOS Simulator,name=iPhone 14 Pro'
