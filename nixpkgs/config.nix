{
    allowBroken = true;
    allowUnfree = true;

    packageOverrides = pkgs: with pkgs; rec {
        nyx-all = buildEnv {
            name = "nyx-all";
            paths = [
                nyx-audio
                nyx-backup
                nyx-bash4
                nyx-compression
                nyx-devtools
                nyx-graphics
                nyx-network-tools
                nyx-nix-tools
                nyx-python36
                nyx-utilities
                nyx-webdev
            ];
        };

        nyx-audio = buildEnv {
            name = "nyx-audio";
            paths = [
                flac
                mpc_cli 
                ncmpcpp 
                shntool 
                sox 
            ];
        };

        nyx-backup = buildEnv {
            name = "nyx-backup";
            paths = [ borgbackup ];
        };

        nyx-bash4 = buildEnv {
            name = "nyx-bash4";
            paths = [ 
                bashInteractive 
                bashCompletion 
            ];
        };

        nyx-compression = buildEnv {
            name = "nyx-compression";
            paths = [ 
                lzma 
                p7zip   # xz
                unrar   # non-free
            ];
        };

        nyx-devtools = buildEnv {
            name = "nyx-devtools";
            paths = [ 
                cmake 
                gitMinimal 
                jq 
                pkgconfig 
            ];
        };

        nyx-graphics = buildEnv {
            name = "nyx-graphics";
            paths = [ 
                exiftool 
                exiv2 
                imagemagick7 
            ];
        };

        nyx-network-tools = buildEnv {
            name = "nyx-network-tools";
            paths = [ 
                httpie 
                nmap
                openssh # include ssh-copy-id
                openssl
                rsync 
                wget
            ];
        };

        nyx-nix-tools = buildEnv {
            name = "nyx-nix-tools";
            paths = [ 
                nix-info 
            ];
        };
        
        nyx-python36 = python36.withPackages (ps: with ps; [ pip ]);

        nyx-utilities = buildEnv {
            name = "nyx-utilities";
            paths = [ 
                exa
                htop
                most
                pstree 
                tree
            ];
        };

        nyx-webdev = buildEnv {
            name = "nyx-webdev";
            paths = [ 
                asciidoctor 
                hugo 
            ];
        };

        ## For others profiles ##

        # nix-env -p $NIX_USER_PROFILE_DIR/webserver -i nyx-webserver
        nyx-webserver = pkgs.buildEnv {
            name = "nyx-webserver";
            paths = [ nginx ];
        };

    };
}
