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

}
