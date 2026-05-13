vim.filetype.add({
  extension = {
    env = 'dotenv'
  },
  filename = {
    ['docker-compose.yaml'] = 'yaml.docker-compose',
    ['docker-compose.yml'] = 'yaml.docker-compose',
    ['compose.yaml'] = 'yaml.docker-compose',
    ['compose.yml'] = 'yaml.docker-compose',
    ['.env'] = 'dotenv',
    ['env'] = 'dotenv',
    ['tmpl'] = 'gotmpl'
  },
  pattern = {
    ['.?env.*'] = 'dotenv',
  },
})
