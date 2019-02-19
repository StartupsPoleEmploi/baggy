FROM ruby:2.6

RUN curl -L https://github.com/wrouesnel/p2cli/releases/download/r5/p2 -o /usr/local/bin/p2 \
        && chmod +x /usr/local/bin/p2

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

RUN apt-get -y update \
	&& apt-get -y install --no-install-recommends nodejs mysql-client git-core libcap2-bin \
        && git clone https://github.com/atech/postal.git /postal \
	&& rm -rf /var/lib/apt/lists/* \
	&& gem install bundler \
	&& gem install procodile \
	&& gem install tzinfo-data \
	&& useradd -r -d /postal -s /bin/bash postal \
	&& chown -R postal:postal /postal/ \
	&& /postal/bin/postal bundle /postal/vendor/bundle \
	&& apt-get -y purge python-dev git-core \
	&& apt-get -y autoremove \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN setcap 'cap_net_bind_service=+ep' /usr/local/bin/ruby

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY ./postal.yml.j2 /postal/config/postal.yml.j2

EXPOSE 5000
WORKDIR /postal

ENV POSTAL_CONFIG_ROOT=/postal/config/local
ENV LOG_TO_STDOUT=1
ENTRYPOINT ["/bin/bash", "-c", "docker-entrypoint.sh ${*}", "--"]
CMD ["procodile", "start", "--foreground", "--clean"]
