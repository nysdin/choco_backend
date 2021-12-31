module GraphqlQueries
  def listed_merchandises_query(end_cursor = nil)
    <<~GRAPHQL
      query {
        merchandises(first: 10, after: "#{end_cursor}") {
          pageInfo {
            endCursor,
            hasNextPage,
            startCursor
          },
          edges {
            node {
              id,
              title,
              price,
              merchandiseImages {
                id,
                url
              }
            }
          }
        }
      }
    GRAPHQL
  end

  def merchandise_detail_query(id:)
    <<~GRAPHQL
      query {
        merchandiseDetail(id: #{id}) {
          id,
          title,
          description,
          price,
          seller {
            id,
            email
          },
          dividedDepartment {
            department {
              name
            }
          }
          merchandiseImages {
            id,
            url,
          }
        }
      }
    GRAPHQL
  end

  def myself_query
    <<~GRAPHQL
      query {
        myself {
          id,
          name,
          image,
          evaluation,
          listedMerchandises {
            id
          }
        }
      }
    GRAPHQL
  end

  def favorite_query(merchandise_id = 0)
    <<~GRAPHQL
      query {
        favorite(merchandiseId: #{merchandise_id}) {
          id,
        }
      }
    GRAPHQL
  end

  def favorite_mutation(merchandise_id: 0, is_favorite: false)
    <<~GRAPHQL
      mutation {
        favorite(input: {
          merchandiseId: #{merchandise_id},
          isFavorited: #{is_favorite},
        }) {
          favorite {
            id,
            user {
              id
            },
            merchandise {
              id
            }
          }
        }
      }
    GRAPHQL
  end
end
