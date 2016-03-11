require_relative '../lib/cmjp_parser'

#
# Calculate how much % of the proposals (proposituras) are petitions (requerimentos), by councilor
# Output format: sorted CSV
#


# Parse proposals
councilors = CmjpParser::ProposalParser.retrieve_year(2015)

# Calculate PROPOSALS / TOTAL ratio

# REQUERIMENTOS / TOTAL
# [ [Councilor, Ratio], ...]

output = []

# Aggregate values
councilors.each do |councilor|
  requerimentos = councilor.proposals.select { |p| p.type == :requerimento }

  output << [councilor.name, requerimentos.size.to_f / councilor.proposals.size]
end

# Sort output
output.sort_by! { |pair| pair[1] }.reverse!

# Print output in CSV format
output.each { |pair| puts pair.join(',') }