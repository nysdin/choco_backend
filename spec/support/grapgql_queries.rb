module GraphqlQueries
  def listed_merchandises_query(endCursor = nil)
    <<~GRAPHQL
      query {
        merchandises(first: 10, after: "#{endCursor}") {
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
end