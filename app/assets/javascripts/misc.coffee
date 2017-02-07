root = exports ? this

# ======================================================
# run script per page tag/s
page_tags = {}
root.tag_page = (page_name) ->
  page_tags[page_name] = true
  return if arguments.length == 1
  for i in [1..arguments.length - 1]
    page_tags[arguments[i]] = true

root.run_ontag = (tag, fn) ->
  fn() if page_tags[tag]
