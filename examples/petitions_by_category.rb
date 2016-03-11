require_relative '../lib/cmjp_parser'

#
# Print the total amount of petitions (requerimentos) by title
# Output format: sorted CSV
#

# Parse proposals
councilors = CmjpParser::ProposalParser.retrieve_year(2015)

# Create empty array
totals = []

# Calculate totals
CmjpParser::Proposal::CATEGORIES.keys.each do |category|
  total = councilors.map(&:proposals).flatten.select { |p| p.category == category }.size

  totals <<  [category.upcase ,total]
end

# Sort
totals.sort_by!{ |p| p[1] }.reverse

# Print
totals.each { |p| puts p.join(',') }

# Total
total = totals.map { |p| p[1] }.inject(:+)

puts "Total: #{total}"

