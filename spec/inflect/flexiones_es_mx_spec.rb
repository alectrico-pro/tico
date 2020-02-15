# spec/locale/flexiones_es_mx_spec.rb

require 'rails_helper'

RSpec.describe :flexiones_es_mx do
  
  contexto_singular_plural = {
    "Sustantivos y adjetivos terminados en -ch forman el plural añadiendo -es" => [
      ["sandwich", "sandwiches"],
      ["maquech", "maqueches"]
    ],

    "Sustantivos y adjetivos terminados en consonantes distintas de -l, -r, -n, -d, -z, -j, -s, -x, -ch forman el plural añadiendo -s" => [
      ["crac", "cracs"],
      ["mamut", "mamuts"],
      ["cómic", "cómics"],
      ["chip", "chips"]
    ],

    "Sustantivos y adjetivos terminados en -l, -r, -n, -d, -z, -j. Si no van precedidas de otra consonante forman el plural añadiendo -es" => [
      ["dócil", "dóciles"],
      ["color", "colores"],
      ["pan", "panes"],
      ["césped", "céspedes"],
      ["cáliz", "cálices"],
      ["reloj", "relojes"],
      ["píxel", "píxeles"],
      ["interfaz", "interfaces"],
      ["sij", "sijes"]
    ],

    "Sustantivos y adjetivos terminados en -i o en -u tónicas forman el plural añadiendo -es" => [
      ["bisturí", "bisturíes"],
      ["tabú", "tabúes"],
      ["hindú", "hindúes"],
      ["israelí", "israelíes"]
    ],

    "Sustantivos y adjetivos terminados en vocal átona o en -e tónica forman el plural añadiendo -s" => [
      ["papá", "papás"],
      ["sofá", "sofás"],
      ["buró", "burós"],
      ["rococó", "rococós"],
      ["dominó", "dominós"],
      ["casa", "casas"],
      ["estudiante", "estudiantes"],
      ["taxi", "taxis"],
      ["comité", "comités"],
      ["bebé", "bebés"]
    ],

    "Sustantivos y adjetivos terminados en grupo consonántico forman el plural añadiendo -s" => [
      ["gong", "gongs"],
      ["iceberg", "icebergs"],
      ["récord", "récords"]
    ],

    "Sustantivos y adjetivos terminados en -y precedida de vocal forman el plural añadiendo -es" => [
      ["ley", "leyes"],
      ["rey", "reyes"],
      ["buey", "bueyes"],
      ["convoy", "convoyes"]
    ],

    "Sustantivos y adjetivos terminados en -s o en -x forman el plural añadiendo -es" => [
      ["tos", "toses"],
      ["vals", "valses"],
      ["fax", "faxes"],
      ["compás", "compáses"]
    ],

    "Voces extranjeras terminadas en -y precedida de consonante. Deben adaptarse gráficamente al español sustituyendo la -y por -i forman el plural añadiendo -s" => [
      ["dandi", "dandis"],
      ["ferri", "ferris"]
    ]
  }
  
  
  describe 'Inflexiones generales para es_Cl' do
    
    contexto_singular_plural.each_pair do |contexto, sp |
      context contexto do
        sp.each do |singular_plural|
          singular = singular_plural[0]
          plural = singular_plural[1]
          
          it "el singular de #{plural} es #{singular}" do
            expect(plural.singularize(:"es_Cl")).to eq singular
          end
          
          it "el plural de #{singular} es #{plural}" do
            expect(singular.pluralize(:"es_Cl")).to eq plural
          end
          
        end
      end
    end
    
  end
 
 
  
end