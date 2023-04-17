
product_id="$(docker run toolbox 3scale -k service list 3scale-tenant | grep location | cut -c 1-2)"

docker run toolbox 3scale -k application-plan create -p \
  --approval-required=false --cost-per-month=0 --setup-fee=0 \
  -t "internal" --trial-period-days=0 3scale-tenant $product_id "Internal Plan"
