LOCALIZATION_PATH="./lib/application/i18n/"
LOCALIZATION_OUTPUT="./lib/generated/"

dart run easy_localization:generate -S "$LOCALIZATION_PATH" -f keys -o locale_keys.g.dart -O "$LOCALIZATION_OUTPUT"
