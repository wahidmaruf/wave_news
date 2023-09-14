# wavenews

Stay informed with our news app, delivering the latest headlines and stories from around the world

## Steps to run the project
- Add .env file in the root of the project
- Add the following code with API key from [newsdata.io](https://newsdata.io/)
    - > apiKey=api_key_here
- Run the prjects in dev or prod flavour. See the commands below

## Commands
### dev flavor run
>  flutter run --flavor dev -t lib/main_dev.dart

### prod flavor run
>  flutter run --flavor prod -t lib/main_prod.dart

### prod flavor build bundle
>  flutter build appbundle --flavor prod -t lib/main_prod.dart --release

### zip the debug symbols in this directory 
> \build\app\intermediates\merged_native_libs\prodRelease\out\lib

## Screenshots
![Screenshot_20230828_123731.png](screenshots%2FScreenshot_20230828_123731.png)
![Screenshot_20230828_123803.png](screenshots%2FScreenshot_20230828_123803.png)
![Screenshot_20230828_123814.png](screenshots%2FScreenshot_20230828_123814.png)
![Screenshot_20230828_123820.png](screenshots%2FScreenshot_20230828_123820.png)
![Screenshot_20230828_123853.png](screenshots%2FScreenshot_20230828_123853.png)
