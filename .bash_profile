alias phpqa='docker run --init -it --rm -v $(pwd):/project -v $(pwd)/var/phpqa:/tmp -w /project jakzal/phpqa:alpine'
alias phpunit@72='docker run -v $(pwd):/p --entrypoint="" -w /p php:7.2-alpine bin/phpunit -c app '
alias php@72='docker run -v $(pwd):/p --entrypoint="" -w /p php:7.2-alpine '
#alias composer='docker run --init --tty --rm -v $(pwd):/p:delegated -v composer_data:/tmp:delegated -w /p -- composer install --ignore-platform-reqs --no-scripts '
alias ptest='docker run  --init -it --rm -v $(pwd):/p --entrypoint="" -w /p php:7.2-alpine'
#alias npm='docker run --init --rm -it -v $(pwd):/p -w /p -p 8999:8999 --entrypoint="" node npm '
#alias yarn='docker run --init --rm -it -v $(pwd):/p -v ~/.npmrc:/root/.npmrc -w /p -p 3000:3000 --entrypoint="" node yarn '
function awsmp()
{
    mutagen terminate pbp || true

    docker-machine start aws-mp
    docker-machine regenerate-certs -f aws-mp
    eval $(docker-machine env aws-mp)
    docker-compose up -d --remove-orphans

    mutagen sync create --name pbp --sync-mode two-way-resolved --symlink-mode posix-raw  --default-file-mode-beta 0644 --default-directory-mode-beta 0755 -i 'app/cache' /Users/marcin/Sites/pbp_docker/pbp_web docker://pbp_docker_pbp_1/var/www/html/

    docker-machine ip aws-mp
}

export PATH=~/Library/Python/3.7/bin:$PATH
