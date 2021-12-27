ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'person', 'people'
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
