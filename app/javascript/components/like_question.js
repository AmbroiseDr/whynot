const unselectLikes = () => {
  const likes = document.querySelector(".answer-with-like")

  if (likes){
    Array.from(likes.children).forEach((like)=>{
      like.classList.remove("active")
    })
  }
}


const selectLike = () => {
  const likes = document.querySelector(".answer-with-like")

  if (likes){
    Array.from(likes.children).forEach((like)=>{
      like.addEventListener("click",()=>{
        unselectLikes()
        like.classList.toggle("active")
      })
    })
  }

}

export { selectLike }
