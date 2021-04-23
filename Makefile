gh-pages: gh-pages-orphan-branch build worktree
gh-pages-orphan-branch:
	git checkout --orphan gh-pages

build:
	yarn build

worktree:
	git --work-tree build add .
	git --work-tree build commit -m \"$(git log '--format=format:%H' main -1)\"
	git push -f origin gh-pages
	git checkout -f main
	git branch -D gh-pages
	rm -r build
