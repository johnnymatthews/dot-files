compress_images() {
    local compress_jpeg=true
    local compress_png=true

    while [[ "$#" -gt 0 ]]; do
        case $1 in
            --help)
                echo "Usage: compress_images [--help] [--png-only] [--jpeg-only]"
                echo "Recursively compresses JPEG and PNG images in the current directory and its subdirectories."
                echo ""
                echo "This function uses jpegoptim for JPEG files and optipng (with parallel processing) for PNG files."
                echo "It strips metadata from JPEG files and uses optimization level 5 for PNG files."
                echo ""
                echo "Options:"
                echo "  --help       Show this help message"
                echo "  --png-only   Compress only PNG files"
                echo "  --jpeg-only  Compress only JPEG files"
                echo ""
                echo "Requirements:"
                echo "  - jpegoptim (for JPEG compression)"
                echo "  - optipng (for PNG compression)"
                echo "  - parallel (for multi-core PNG compression)"
                echo ""
                echo "To install the required tools on Ubuntu, run:"
                echo "sudo apt-get install jpegoptim optipng parallel"
                return 0
                ;;
            --png-only)
                compress_jpeg=false
                compress_png=true
                ;;
            --jpeg-only)
                compress_jpeg=true
                compress_png=false
                ;;
            *)
                echo "Unknown option: $1"
                echo "Use --help for usage information"
                return 1
                ;;
        esac
        shift
    done

    if $compress_jpeg && ! command -v jpegoptim &> /dev/null; then
        echo "Error: jpegoptim not found. Please install it first."
        echo "You can install it using: sudo apt-get install jpegoptim"
        return 1
    fi

    if $compress_png && (! command -v optipng &> /dev/null || ! command -v parallel &> /dev/null); then
        echo "Error: optipng and/or parallel not found. Please install them first."
        echo "You can install them using: sudo apt-get install optipng parallel"
        return 1
    fi

    if $compress_jpeg; then
        echo "Compressing JPEG files..."
        find . -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -print0 | xargs -0 jpegoptim --strip-all --all-progressive
    fi

    if $compress_png; then
        echo "Compressing PNG files using multiple cores..."
        find . -type f -iname "*.png" -print0 | parallel -0 -j+0 optipng -o5 {}
    fi

    echo "Image compression complete."
}
