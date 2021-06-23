class QueryMutation{

postsQuery(){
  return """
query{
  posts{
    id
    title
    body
    published
  }
}
""";
}

details(){
  return """
query post(\$id: ID!){
  post(id: \$id){
    id
    title
    body
    published
    author{
      id
      name
      email
    }
    comments{
      text
      author{
        id
        name
      }
    }
  }
}
""";
}



}
