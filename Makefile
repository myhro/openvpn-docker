clean: down
	rm -f *.ovpn
	sudo rm -rf etc/
	mkdir etc

down:
	docker-compose down

genclient:
	docker-compose run --rm app easyrsa build-client-full $(name) nopass

getclient:
	docker-compose run --rm app ovpn_getclient $(name) > $(name).ovpn

init:
	docker-compose run --rm app ovpn_genconfig -u udp://$(server)
	docker-compose run --rm app ovpn_initpki

logs:
	docker-compose logs -f

shell:
	docker-compose run --rm app sh

up:
	docker-compose up -d app
