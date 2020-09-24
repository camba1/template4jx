appup:
	set -a
	. ./docker-node.env
	set +a
	docker run -p 8080:8080 --env-file ./docker-node.env --name jxnodemysqlcont jxnodemysql

appbuild:
	docker build -t jxnodemysql .

appdown:
	docker stop jxnodemysqlcont
	docker rm jxnodemysqlcont

seepipeactive:    
	jx get activity -f FastTrackWithJenkins -w

seepipelog:    
	jx get build logs BB-jx/FastTrackWithJenkins/master

seepipes:
	jx get pipelines

seeapps:  
	jx get applications

buildlogs:
	 jx get build logs BB-jx/FastTrackWithJenkins

getenv:
	jx get env 

newenv:
	jx create env

pushprod:
	jx promote --app fasttrackwithjenkins --version $(VERSION) --env production

pullrequest:
	jx create pullrequest
 
