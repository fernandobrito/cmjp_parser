require_relative '../lib/cmjp_parser'

councilors = CmjpParser::ProposalParser.retrieve_year(2015)

#
# Print the total amount of petitions (requerimentos) by title
# Output format: { councilor => { :category => ammount, ... }, ... }
#

output = {}

councilors.each do |councilor|
  categories_count = {}

  CmjpParser::Proposal::CATEGORIES.keys.each do |category|
    total = councilor.proposals.select { |p| p.category == category && p.type == :requerimento }.size
    categories_count.store(category, total)
  end

  output.store(councilor.name, categories_count)
end

pp output

