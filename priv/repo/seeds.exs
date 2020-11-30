unip =
  %{
    name: "UNIP",
    score: 4.5,
    logo_url: "https://www.tryimg.com/u/2019/04/16/unip.png",
    campus: [
      %{
        name: "Jaguaré",
        city: "São Paulo",
        courses: [
          %{
            name: "Biomedicina",
            kind: "Presencial",
            level: "Bacharelado",
            shift: "Noite",
            offer: %{
              full_price: 1487.31,
              price_with_discount: 520.56,
              discount_percentage: 65.0,
              start_date: "01/08/2019",
              enrollment_semester: "2019.2",
              enabled: true
            }
          }
        ]
      },
      %{
        name: "Paraíso",
        city: "São Paulo",
        courses: [
          %{
            name: "Propaganda e Marketing",
            kind: "Presencial",
            level: "Bacharelado",
            shift: "Noite",
            offer: %{
              full_price: 1447.29,
              price_with_discount: 477.61,
              discount_percentage: 67.0,
              start_date: "01/08/2019",
              enrollment_semester: "2019.2",
              enabled: true
            }
          }
        ]
      },
      %{
        name: "Parque São Jorge",
        city: "São Paulo",
        courses: [
          %{
            name: "Arquitetura e Urbanismo",
            kind: "Presencial",
            level: "Bacharelado",
            shift: "Manhã",
            offer: %{
              full_price: 1668.4,
              price_with_discount: 617.31,
              discount_percentage: 63.0,
              start_date: "01/08/2019",
              enrollment_semester: "2019.2",
              enabled: true
            }
          }
        ]
      },
      %{
        name: "Jardim das Indústrias",
        city: "São José dos Campos",
        courses: [
          %{
            name: "Engenharia Mecânica",
            kind: "Presencial",
            level: "Bacharelado",
            shift: "Noite",
            offer: %{
              full_price: 2139.64,
              price_with_discount: 706.08,
              discount_percentage: 67.0,
              start_date: "01/08/2019",
              enrollment_semester: "2019.2",
              enabled: true
            }
          }
        ]
      },
      %{
        name: "Água Branca",
        city: "São Paulo",
        courses: [
          %{
            name: "Jornalismo",
            kind: "Presencial",
            level: "Bacharelado",
            shift: "Noite",
            offer: %{
              full_price: 1227.05,
              price_with_discount: 515.36,
              discount_percentage: 58.0,
              start_date: "01/08/2019",
              enrollment_semester: "2019.2",
              enabled: true
            }
          }
        ]
      }
    ]
  }
  |> OffersCourse.Universities.create_university()
