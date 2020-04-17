---
layout: page
title: Chorizo Tools - Scripts de sysadmin
category: repository
description: >
  Chorizo tools es un repo de scripts de operaciones.  Varios han sido sus
  colaboradores.
---

## Recursos

* [Repositorio](https://github.com/kelkoo-services/chorizo-tools)

## Descripción

Este proyecto ya estaba antes de que yo entrara.  Está compuesto por shell
 scripts, entiendo que para no añadir ninguna dependencia a los equipos de
 desarrolladores que antiguamente los usaban.

A continuación describo el uso y aplicación de los scripts:

### purge_page.sh

#### Requisitos

* CLOUDFLARE_ACCOUNT
* CLOUDFLARE_API_KEY

Este script es para borrar una página de la web de kelisto de la cache de
 cloudflare.  Es el comando que más uso habitualmente.  Requiere de tener
 las variables de entorno bien definidas y de pasar un endpoint correctamente.

    $ purge_page.sh https://www.kelisto.es/politica-de-privacidad [otra url]

Devuelve un JSON con un resultado.


### block_ip_cloudflare.sh

#### Requisitos

* CLOUDFLARE_ACCOUNT
* CLOUDFLARE_API_KEY

Este script se utiliza para bloquear una IP en cloudflare desde la línea de
 comandos rápidamente.

    $ block_ip_cloudflare.sh 10.0.2.2

Al bloquear la IP se envía un mensaje a cloudflare que se puede usar para
 trazar cuándo se cortó acceso a una IP:

![](/assets/img/cloudflare-firewall-block-ip-001.png)

"This rule is on because of an event that occured on date 2018-02-23"
{:.lead}

### cloudflare_dns_get_record_id.sh

#### Requisitos

* CLOUDFLARE_ACCOUNT
* CLOUDFLARE_API_KEY

Este script se usa para resolver un dominio de DNS a una zone_id, necesario
 para varias llamadas a las APIs de Cloudflare:

    $ cloudflare_dns_get_record_id.sh kelisto.es

### cloudflare_failover_switcher.sh

#### Requisitos

* CLOUDFLARE_ACCOUNT
* CLOUDFLARE_API_KEY

Este es el script que hace la magia en el failover.  Se encarga de cambiar el
 CNAME al que cloudflare apunta por detrás para cada aplicación web.

Utiliza un fichero que descarga desde:

* https://s3-eu-west-1.amazonaws.com/kelisto-ops/monitoring/failover_config.yml

OJO, lee el fichero, que sólo acepta ciertos nombres, no todos:

    "Syntax: $0 {www|comunicacion|energia|seguros|finanzas|finanzas-agentes|finanzas-backend}"

Salida: 

    $ export CLOUDFLARE_ACCOUNT=<<ask your administrator>>
    $ export CLOUDFLARE_API_KEY=<<ask your administrator>>
    $ cloudflare_failover_switcher.sh www
    Starting...
    Trying to download file: https://s3-eu-west-1.amazonaws.com/kelisto-ops/monitoring/failover_config.yml
    Done.
    Current endpoint for www is: kelisto-cms.herokuapp.com

    1) production
    2) failover
    #? 2
    I'm going to execute the following: set origin of www.kelisto.es as kelisto-cms.aws.ie.a9sapp.eu.
    Are you sure?(Yes/No)
    1) Yes
    2) No
    #? 1
    Last check: Current endpoint for www is: kelisto-cms.aws.ie.a9sapp.eu

### create_beta, create_feature.sh y fork_seguros.sh

#### Requisitos

* Tener heroku toolbelt
* Estar autenticado en heroku como services.tech@kelisto.es
* Tener el plugin [heroku-fork](https://github.com/heroku/heroku-fork)

Estas herramientas sirven para crear un clon de una aplicación de heroku.
  Utilizados para crear betas (demos) y aplicaciones con una rama de código
 diferente.

Requieren del plugin de [heroku-fork](https://github.com/heroku/heroku-fork)
 instalado en tu heroku toolbelt.

    $ create_beta.sh source_app beta_name [other collaborators]
    $ create_feature.sh source_app ft_name [other collaborators]

Agrega un sufijo -beta o -ft a la aplicación de heroku, y le registra una
 dirección DNS del dominio kelisto.us a la aplicación.

En esta línea también actúa el script fork_seguros.sh, salvo que sólo se usa
 para crear "features" de seguros con un sufijo -fork y OJO! DOMINIO KELISTO.ES.

    $ fork-seguros.sh tag_name

Por último, destruir estas aplicaciones es tan sencillo como usar:

    $ heroku destroy -a app_name

NOTA: Asegurate de que el nombre es el correcto.  No vayas a borrar el de
 producción.

### heroku_add_kelistodevs.sh

#### Requisitos

* Tener heroku toolbelt
* Estar autenticado en heroku
* Tener acceso a la aplicación

Esta es una utilidad para dar acceso a todos los desarrolladores a una app de
 heroku en un solo comando.

    $ heroku_add_kelistodevs.sh app

NOTA: La lista de desarrolladores se mantiene en el propio script.  Cuando
 cambie la lista de desarrolladores, se tendrá que editar el script para
 mantenerlo actualizado.
 
### heroku_add_user.sh y heroku_remove_user.sh

#### Requisitos

* Tener heroku toolbelt
* Estar autenticado en heroku
* Tener acceso a la aplicación

Estas son un par de utilidades para dar o quitar acceso a un único usuario
 a todas las apps de heroku en un solo comando.

    $ heroku_add_user.sh heroku_user [env]
    $ heroku_remove_user.sh heroku_user [env]

El parámetro env puede ser staging, beta o lo que se quiera.  En ausencia de
 parámetro, se aplica a todas las aplicaciones.

### ssl_expiration_dates.sh

#### Requisitos

* Tener heroku toolbelt
* Estar autenticado en heroku
* Tener acceso a la aplicación

Este script sirve para chequear la fecha de expiración de los certificados que
 tenemos en heroku.  Ahora no tiene mucha utilidad, ya que a través de heroku
 nos proporcionan un certificado propio para las aplicaciones de pago, pero
 por si en alguna ocasión puede ser de utilidad.

    $ ssl_expiration_dates.sh