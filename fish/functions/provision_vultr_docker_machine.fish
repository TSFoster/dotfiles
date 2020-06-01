function provision_vultr_docker_machine
  set -l options \
    (fish_opt --short=n --long=no-swarm --long-only) \
    (fish_opt --short=h --long=help)

  argparse $options -- $argv

  set cmd (basename (status function))

  if set -q _flag_help
    echo "$cmd -h | --help"
    echo '    This help message'
    echo ''
    echo "$cmd NAME [ --no-swarm ]"
    echo "    Create machine."
    return 0
  end

  [ (count $argv) -eq 0 ]; and echo 'You must provide a name for docker-machine'; and return 1

  if not set -q VULTR_API_KEY
    echo 'You must have $VULTR_API_KEY set, try one of the following options:'
    echo '    by running: env VULTR_API_KEY={key} '(basename (status filename))
    echo '    by setting it in ~/.config/fish/secrets.fish'
    return 1
  end

  set -q VULTR_PLAN_ID; or set -l VULTR_PLAN_ID 201 # $5/month
  set -q VULTR_REGION_ID; or set -l VULTR_REGION_ID 8 # London
  set -q VULTR_OS_ID; or set -l VULTR_OS_ID 179 # CoreOS

  docker-machine create \
  --driver vultr \
  --vultr-api-key=$VULTR_API_KEY \
  --vultr-plan-id=$VULTR_PLAN_ID \
  --vultr-region-id=$VULTR_REGION_ID \
  --vultr-os-id=$VULTR_OS_ID \
  --vultr-tag=$argv[1] \
  --vultr-private-networking \
  --vultr-backups \
  $swarmFlags \
  $argv

  if not set -q _flag_no_swarm
    dmenv $argv[1]
    set machineIP (docker-machine inspect $machineName --format '{{.Driver.PrivateIP}}')
    docker swarm init --advertise-addr $machineIP
  end
end
