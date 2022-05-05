export const getInitials = (firstname, lastname) => {
  if(!firstname && !lastname) return ""

  if (!firstname) return lastname[0]

  if (!lastname) return firstname[0]

  return `${firstname[0]}${lastname[0]}`
}
