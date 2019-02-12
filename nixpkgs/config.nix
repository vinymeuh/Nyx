{
    allowBroken = true;
    allowUnfree = true;

    packageOverrides = pkgs: with pkgs; rec {
        nyx-all = buildEnv {
            name = "nyx-all";
            paths = [
                # audio
                flac
                mpc_cli 
                mpd
                ncmpcpp 
                shntool 
                sox
                # backup
                borgbackup
                # bash4
                bashInteractive
                bashCompletion
                # compression
                lzma 
                p7zip   # xz
                unrar   # non-free
                # devtools
                cmake 
                gitMinimal 
                jq 
                pkgconfig 
                # devlibs
                openssl.dev
                # graphics
                exiftool 
                exiv2 
                imagemagick7
                # mosquitto
                mosquitto
                # network-tools
                httpie 
                nmap
                openssh # include ssh-copy-id
                openssl
                rsync 
                wget
                # nix tools
                nix-info
                # python
                nyx-python27
                nyx-python36
                # utilities
                exa
                htop
                most
                pstree 
                tree
                # webdev
                asciidoctor 
                hugo 
            ];
        };
        
        nyx-python27 = python27.withPackages (ps: with ps; [ ]);

        nyx-python36 = python36.withPackages (ps: with ps; [ ]);

        ## For others profiles ##

        # nix-env -p $NIX_USER_PROFILE_DIR/webserver -i nyx-webserver
        nyx-webserver = pkgs.buildEnv {
            name = "nyx-webserver";
            paths = [ nginx ];
        };

    };
}
