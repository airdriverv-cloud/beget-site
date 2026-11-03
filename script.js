const io = new IntersectionObserver((entries) => {
  for (const e of entries) if (e.isIntersecting) { e.target.classList.add('in'); io.unobserve(e.target); }
}, { threshold: 0.15 });
for (const el of document.querySelectorAll('.card, .note, h2.sec')) {
  el.classList.add('reveal');
  io.observe(el);
}
