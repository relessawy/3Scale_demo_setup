
#Warning login to OpenShift cluster before you run
#Find application IDs
partnerplan_id="$(docker run toolbox 3scale -k application list 3scale-tenant | grep partners_plan | cut -c 1-2)"

developerplan_id="$(docker run toolbox 3scale -k application list 3scale-tenant | grep developer_plan | cut -c 1-2)"

internalplan_id="$(docker run toolbox 3scale -k application list 3scale-tenant | grep internal_plan | cut -c 1-2)"

#Delete Applications
docker run toolbox 3scale -k application delete 3scale-tenant $partnerplan_id

docker run toolbox 3scale -k application delete 3scale-tenant $developerplan_id

docker run toolbox 3scale -k application delete 3scale-tenant $internalplan_id


#Delete Application Plans
docker run toolbox 3scale -k application-plan delete  \
   3scale-tenant 4 "partners"

docker run toolbox 3scale application-plan delete  \
   3scale-tenant 4 "internal"

docker run toolbox 3scale application-plan delete  \
      3scale-tenant 4 "developers"


