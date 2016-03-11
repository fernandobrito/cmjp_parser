module CmjpParser

  # Parse
  module ProposalParser
    PROPOSALS_PAGE = 'http://177.200.32.195:9673/sapl/relatorios_administrativos/resumoPropositurasAutor/resumoPropositurasAutor_index_html'

    # Class methods
    class << self

      # Retrieve all proposals, grouped by Councilor
      # @return [Array<Councilor>]
      def retrieve_year(year)
        # HTTP Resquest
        doc = Nokogiri::HTML(RestClient.post(PROPOSALS_PAGE, selAno: year))

        # Cache, for debugging
        # doc = Nokogiri::HTML(File.open(File.join(File.dirname(__FILE__), '../../cache/2015.html')))

        # Select all rows from the table #conteudo
        rows = doc.css('#conteudo tr')

        # Initialize objects
        councilors = []
        current_councilor = nil

        # Iterate over rows
        rows[2..-1].each do |row|

          # If it is the end (there is a field set in the end with aggregated data)
          if row.css('fieldset').size > 0
            break
          end

          # if this is a name (table has rows with names and everything below belongs to him/her)
          if row.css('label').size > 0
            councilor_name = normalize(row.css('label').first.content)
            current_councilor = CmjpParser::Councilor.find_or_insert(councilors, councilor_name)
          end

          # proposals have 2 columns (name and title)
          if row.css('td').size == 2
            name = normalize(row.css('td')[0].content)
            title = normalize(row.css('td')[1].content)

            current_councilor.proposals << CmjpParser::Proposal.new(year, name, title)
          end
        end

        # Return all councilors
        councilors
      end

      # TODO: include other special characters and move from here
      def normalize(str)
        str.strip.upcase.gsub('ã', 'Ã').gsub('ç', 'Ç')
      end

    end
  end
end