Comando para comenzar instalacion a partir de aqui se trabaja con el dockerfile de rails

docker run --rm \
  -v $(pwd):/myapp \
  -w /myapp \
  ruby:3.2-slim \
  bash -c "apt-get update && \
           apt-get install -y build-essential git libyaml-dev libpq-dev curl && \
           curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
           apt-get install -y nodejs && \
           gem install rails && \
           rails new . --force --skip-bundle --database=postgresql --docker &&\
           gem install bundler && \
           bundle install"
