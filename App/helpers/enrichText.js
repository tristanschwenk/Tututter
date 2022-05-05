const enrichContent = (content) => content
  .replace(/#([\w\d_]+)/g, `<nuxt-link to="/hashtag/$1">#$1</nuxt-link>`) // Hashtags
  .replace(/@([\w\d_.]+)/g, `<nuxt-link to="/user/$1">@$1</nuxt-link>`); // Mentions

export const useEnrichContent = (content) => {
  if (content === null) content = ""
  return {
    name: "PostContent",
    template: `<div>${enrichContent(content)}</div>`
  }
}
