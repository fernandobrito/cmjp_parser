require_relative '../lib/cmjp_parser'

#
# Print the title of all petitions (requerimentos) that have not been categorized by
#  our regular expressions. Useful for creating new rules.
# Output format: sorted titles
#

# Parse proposals
councilors = CmjpParser::ProposalParser.retrieve_year(2015)

# Sorted titles
councilors.map(&:proposals).flatten.select { |p| p.type == :requerimento && p.category == :outros }.map(&:title).sort.each do |p|
  puts p
end
