module CmjpParser
  class Proposal
    CATEGORIES = {
        medalha: /MEDALHA (CIDADE)|(DO MÉRITO)|(DA CIDADE)/,
        honra: /HONRA AO MÉRITO/,
        votos: /(VOTOS)|(VOTO DE)|(VOTOR)|(ALPAUSOS)/,
        comenda: /CONCEDE A? COMENDA/,
        utilidade_publica: /UTILIDADE P(U|Ú)BLICA/,
        calendario: /CALENDÁRIO OFICIAL/,
        cidadao: /CIDADÃO PESSOENSE/,
        denomina: /DENOMINA DE/,
        repudio: /VOTOS? DE REPÚDIO/,
        semob: /SEMOB|(PINTURA DA (LOMBADA|FAIXA DE PEDESTRE))|(SEMÁFORO)|(PLACAS DE SINALIZAÇÃO)|(LOMBADA)|(REVITALIZAÇÃO DA SINALIZAÇÃO)|(FAIXA(S)? DE PEDESTRE)|(AGENTES DE TRÂNSITO)/,
        emlur: /(EMLUR)|(SERVIÇO(S)? DE LIMPEZA)|(LIMPEZA DA RUA)|(LIMPEZA E CAPINAÇÃO)|(CAPINAÇÃO E LIMPEZA)|(CAPINAGEM)|(RECOLHIMENTO DE)/,
        seinfra: /(SEINFRA)|(TAMPAS DAS GALERIAS)|DESOBSTRUÇÃO D(E|A) GALERIA|(GALERIAS PLUVIA(IS|L))|(CALÇAMENTO)|(TAPA BURACO)|(RECAPEAMENTO)|(PAVIMENTAÇÃO (N|D)A RUA)|(ILUMINAÇÃO)|(SANEAMENTO BÁSICO NA RUA)|(CALÇAMENTO (N|D)A RUA)|(TERRAPL(A|E)NAGEM)|(PAVIMENTAÇÃO)|(LUMINÁRIAS)|(LÂMPADAS)/,
        cagepa: /CAGEPA/,
        sedec: /(SEDEC)|(SECRETARIA DE EDUCAÇÃO)|(MANUTENÇÃO NA ESC\.)/,
        sedurb: /SEDURB|(CANTEIRO DAS PRAÇAS)|(CONSTRUÇÃO DE UMA PRAÇA)|(REFORMA NO MERCADO)/,
        energisa: /ENERGISA/,
        sejer: /SEJER/,
        campanha: /CAMPANHA SOBRE/,
        semam: /SEMAM|(PODA DE (A|Á)RVORES)/,
        pmjp: /SOLICITA À PMJP/,
        cmjp: /CMJP/,
        sessao_especial: /SESSÃO (ESPECIAL|SOLENE)/,
        audencia_publica: /NCIA PÚBLICA/,
        saude: /SMS|SECRETARIA (MUNICIPAL )?DE SAÚDE|SEC DE SAÚDE/,
        semusb: /SEMUSB/,
        defesa_civil: /DEFESA CIVIL/,
        seplan: /SEPLAN/,
        comando_geral_policia: /POLICIAMENTO|(COMANDO GERAL DA POLICIA)/,
        prefeito: /PREFEITO/,
        outros: /.*/
    }

    TYPES = {
        decreto_legislativo: /DECRETO LEGISLATIVO/,
        emenda_lei_organica: /EMENDA à LEI ORGâNICA/,
        lei_ordinaria: /LEI ORDINáRIA/,
        resolucao: /RESOLUçãO/,
        requerimento: /REQUERIMENTO/,
        mensagem_executivo: /MENSAGEM EXECUTIVO/,
        lei_complementar: /LEI COMPLEMENTAR/,
        indicacao: /INDICAÇÃO/,
        medida_provisoria: /MEDIDA PROVISóRIA/,
        veto: /VETO/,
        outros: /.*/
    }

    attr_accessor :year, :type, :name, :title, :category

    # Name: Projeto de Lei Ordinária 1297/2016
    # Title: CRIA, NO MUNICÍPIO DE JOÃO PESSOA, O PROJETO “AMAMENTAR É UM DIREITO”.
    def initialize(year, name, title)
      @year = year
      @name = name
      @title = title

      @type = parse_type(name)
      @category = parse_category(title)
    end

  private
    def parse_category(title)
      CATEGORIES.each_pair do |category, pattern|
        if pattern =~ title
          return category
        end
      end

      return nil
    end

    def parse_type(name)
      TYPES.each_pair do |type, pattern|
        if pattern =~ name
          return type
        end
      end

      return nil
    end

  end
end