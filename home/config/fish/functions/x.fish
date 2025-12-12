# From https://github.com/shoriminimoe/fish-extract


# MIT License

# Copyright (c) 2022 Sam Caldwell

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
function _extract_help
    echo "usage: extract FILE [FILE ...]"
end


function x -d "Extract archives"
    if test (count $argv) -lt 1
        _extract_help
        return 1
    end

    if command -v gtar
        # use GNU tar if available. This is what gnu-tar is installed as on
        # macOS.
        set tar gtar
    else
        set tar tar
    end

    set failed false

    for file in $argv
        switch $file
            case '*.tar'
                $tar xvf "$file"

            case '*.tar.gz' '*.tgz'
                $tar xvzf "$file"

            case '*.tar.bz2' '*.tar.bz' '*.tbz' '*.tbz2'
                $tar xvjf "$file"

            case '*.tar.xz' '*.txz'
                $tar xvJf "$file"

            case '*.tar.Z' '*.taz'
                $tar xvZf "$file"

            case '*.tar.zst' '*.tzst'
                $tar --zstd -xvf "$file"

            case '*.tar.lzma' '*.tar.zma' '*.tlz'
                $tar --lzma -xvf "$file"

            case '*.tar.lrz'
                lrzuntar "$file"

            case '*.tar.lz'
                $tar --lzip -xvf "$file"

            case '*.tar.lz4'
                $tar --use-compress-program=lz4 -xvf "$file"

            case '*.tar.lzo'
                $tar --lzop -xvf "$file"

            case '*.7z' '*.iso'
                7zz x "$file"

            case '*.gz'
                gunzip --keep "$file"

            case '*.bz2' '*.bz'
                bunzip2 --keep "$file"

            case '*.xz'
                unxz --keep "$file"

            case '*.lrz'
                lrunzip "$file"

            case '*.lz4'
                unlz4 "$file" (string replace --regex '.lz4$' '' "$file")

            case '*.lzma'
                unlzma --keep "$file"

            case '*.zip' '*.xpi' '*.jar'
                unzip "$file"

            case '*.Z'
                uncompress -k "$file"

            case '*.zst'
                unzstd --keep "$file"

            case '*.zz'
                unpigz --keep "$file"

            case '*'
                echo >&2 "extract: failed to extract '$file': no extractor implemented for file type"
                set failed true
        end

        if test $status -ne 0
            echo >&2 "Failed to extract '$file'"
            set failed true
        end
    end

    if $failed
        return 1
    end
end
