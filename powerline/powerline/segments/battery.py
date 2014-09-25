def battery(pl):
  from subprocess import Popen, PIPE
  p = Popen(['battery', '-o', 'tmux'], stdout=PIPE, stderr=PIPE, stdin=PIPE)
  output = p.stdout.read()
  return [{'contents': output}]
