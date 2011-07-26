# Programmable completion for the Bazaar-NG bzr command under bash.
# Known to work with bash 2.05a as well as bash 4.1.2, and probably
# all versions in between as well.

# Based originally on the svn bash completition script.
# Customized by Sven Wilhelm/Icecrash.com
# Adjusted for automatic generation by Martin von Gagern

# Generated using the bash_completion plugin.
# See https://launchpad.net/bzr-bash-completion for details.

# Commands and options of bzr 2.4b5 and the following plugins:
# bash_completion 2.4b5
# launchpad 2.4b5

shopt -s progcomp
_bzr ()
{
	local cur cmds cmdIdx cmd cmdOpts fixedWords i globalOpts
	local curOpt optEnums
	local IFS=$' \n'

	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}

	cmds='add added alias ancestry annotate ann blame praise assert-fail bash-completion bind branch get clone break-lock bundle-info bundle-revisions bundle cat cat-revision check checkout co clean-tree commit ci checkin config conflicts deleted diff di dif dpush dump-btree export export-pot file-id file-path find-merge-base help ? --help -? -h hooks ignore ignored info init init-repository init-repo inventory join launchpad-login lp-login launchpad-mirror lp-mirror launchpad-open lp-open local-time-offset log lookup-revision lp-find-proposal lp-propose-merge lp-submit lp-propose ls merge merge-directive missing mkdir modified mv move rename nick pack plugins pull push re-sign reconcile reconfigure reference register-branch relpath remerge remove rm del remove-branch rmbranch remove-tree renames repair-workingtree resolve resolved revert revision-history revision-info revno rocks root selftest send serve server shell-complete s-c shelve sign-my-commits split status st stat switch tag tags test-script testament touching-revisions unbind uncommit unknowns unshelve update up upgrade verify-signatures version version-info view wait-until-signalled whoami'
	globalOpts=( --builtin --concurrency --coverage --lsprof --lsprof-file --no-aliases --no-l10n --no-plugins --profile --version )

	# do ordinary expansion if we are anywhere after a -- argument
	for ((i = 1; i < COMP_CWORD; ++i)); do
		[[ ${COMP_WORDS[i]} == "--" ]] && return 0
	done

	# find the command; it's the first word not starting in -
	cmd=
	for ((cmdIdx = 1; cmdIdx < ${#COMP_WORDS[@]}; ++cmdIdx)); do
		if [[ ${COMP_WORDS[cmdIdx]} != -* ]]; then
			cmd=${COMP_WORDS[cmdIdx]}
			break
		fi
	done

	# complete command name if we are not already past the command
	if [[ $COMP_CWORD -le cmdIdx ]]; then
		COMPREPLY=( $( compgen -W "$cmds ${globalOpts[*]}" -- $cur ) )
		return 0
	fi

	# find the option for which we want to complete a value
	curOpt=
	if [[ $cur != -* ]] && [[ $COMP_CWORD -gt 1 ]]; then
		curOpt=${COMP_WORDS[COMP_CWORD - 1]}
		if [[ $curOpt == = ]]; then
			curOpt=${COMP_WORDS[COMP_CWORD - 2]}
		elif [[ $cur == : ]]; then
			cur=
			curOpt="$curOpt:"
		elif [[ $curOpt == : ]]; then
			curOpt=${COMP_WORDS[COMP_CWORD - 2]}:
		fi
	fi

	cmdOpts=( )
	optEnums=( )
	fixedWords=( )
	case $cmd in
	add)
		cmdOpts=( --dry-run --no-dry-run --file-ids-from --help --no-help -h --no-recurse --recurse --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	added)
		cmdOpts=( --directory -d --help --no-help -h --no-null --null -0 --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	alias)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-remove --remove --no-usage --usage --no-verbose --verbose -v )
		;;
	ancestry)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	annotate|ann|blame|praise)
		cmdOpts=( --all --no-all --directory -d --help --no-help -h --long --no-long --no-quiet --quiet -q --revision -r --no-show-ids --show-ids --no-usage --usage --no-verbose --verbose -v )
		;;
	assert-fail)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	bash-completion)
		# plugin "bash_completion 2.4b5"
		cmdOpts=( --debug --no-debug --function-name -f --function-only --no-function-only -o --help --no-help -h --plugin --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	bind)
		cmdOpts=( --directory -d --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	branch|get|clone)
		cmdOpts=( --bind --no-bind --files-from --hardlink --no-hardlink --help --no-help -h --no-tree --tree --no-quiet --quiet -q --revision -r --no-stacked --stacked --no-standalone --standalone --no-switch --switch --no-usage --usage --no-use-existing-dir --use-existing-dir --no-verbose --verbose -v )
		;;
	break-lock)
		cmdOpts=( --config --no-config --force --no-force --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	bundle-info)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	bundle-revisions|bundle)
		cmdOpts=( --format=0.9 --format=4 --from -f --help --no-help -h --bundle --no-bundle --no-patch --patch --output -o --no-quiet --quiet -q --no-remember --remember --revision -r --no-strict --strict --no-usage --usage --no-verbose --verbose -v )
		case $curOpt in
			--format) optEnums=( 0.9 4 ) ;;
		esac
		;;
	cat)
		cmdOpts=( --directory -d --filters --no-filters --help --no-help -h --name-from-revision --no-name-from-revision --no-quiet --quiet -q --revision -r --no-usage --usage --no-verbose --verbose -v )
		;;
	cat-revision)
		cmdOpts=( --directory -d --help --no-help -h --no-quiet --quiet -q --revision -r --no-usage --usage --no-verbose --verbose -v )
		;;
	check)
		cmdOpts=( --branch --no-branch --help --no-help -h --no-quiet --quiet -q --no-repo --repo --no-tree --tree --no-usage --usage --no-verbose --verbose -v )
		;;
	checkout|co)
		cmdOpts=( --files-from --hardlink --no-hardlink --help --no-help -h --lightweight --no-lightweight --no-quiet --quiet -q --revision -r --no-usage --usage --no-verbose --verbose -v )
		;;
	clean-tree)
		cmdOpts=( --detritus --no-detritus --directory -d --dry-run --no-dry-run --force --no-force --help --no-help -h --ignored --no-ignored --no-quiet --quiet -q --no-unknown --unknown --no-usage --usage --no-verbose --verbose -v )
		;;
	commit|ci|checkin)
		cmdOpts=( --author --commit-time --exclude -x --file -F --fixes --help --no-help -h --local --no-local --lossy --no-lossy --message -m --no-quiet --quiet -q --no-show-diff --show-diff -p --no-strict --strict --no-unchanged --unchanged --no-usage --usage --no-verbose --verbose -v )
		;;
	config)
		cmdOpts=( --all --no-all --directory -d --help --no-help -h --no-quiet --quiet -q --no-remove --remove --scope --no-usage --usage --no-verbose --verbose -v )
		;;
	conflicts)
		cmdOpts=( --directory -d --help --no-help -h --no-quiet --quiet -q --no-text --text --no-usage --usage --no-verbose --verbose -v )
		;;
	deleted)
		cmdOpts=( --directory -d --help --no-help -h --no-quiet --quiet -q --no-show-ids --show-ids --no-usage --usage --no-verbose --verbose -v )
		;;
	diff|di|dif)
		cmdOpts=( --change -c --diff-options --format=default -F --help --no-help -h --new --old --prefix -p --no-quiet --quiet -q --revision -r --no-usage --usage --using --no-verbose --verbose -v )
		case $curOpt in
			--format) optEnums=( default ) ;;
		esac
		;;
	dpush)
		cmdOpts=( --directory -d --help --no-help -h --no-rebase --rebase --no-quiet --quiet -q --no-remember --remember --no-strict --strict --no-usage --usage --no-verbose --verbose -v )
		;;
	dump-btree)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-raw --raw --no-usage --usage --no-verbose --verbose -v )
		;;
	export)
		cmdOpts=( --directory -d --filters --no-filters --format --help --no-help -h --no-per-file-timestamps --per-file-timestamps --no-quiet --quiet -q --revision -r --root --no-usage --usage --no-verbose --verbose -v )
		;;
	export-pot)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	file-id)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	file-path)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	find-merge-base)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	help|?|--help|-?|-h)
		cmdOpts=( --help --no-help -h --long --no-long --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		fixedWords=($cmds authentication basic branches bugs checkouts configuration conflict-types content-filters criss-cross current-formats debug-flags diverged-branches env-variables eol files formats global-options hooks launchpad location-alias log-formats other-formats patterns repositories revisionspec rules standalone-trees standard-options status-flags sync-for-reconfigure topics urlspec working-trees)
		;;
	hooks)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	ignore)
		cmdOpts=( --default-rules --no-default-rules --directory -d --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	ignored)
		cmdOpts=( --directory -d --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	info)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	init)
		cmdOpts=( --append-revisions-only --no-append-revisions-only --create-prefix --no-create-prefix --1.14 --1.14-rich-root --1.6 --1.6.1-rich-root --1.9 --1.9-rich-root --2a --default --default-rich-root --development-subtree --development5-subtree --dirstate --dirstate-tags --dirstate-with-subtree --format=1.14 --format=1.14-rich-root --format=1.6 --format=1.6.1-rich-root --format=1.9 --format=1.9-rich-root --format=2a --format=default --format=default-rich-root --format=development-subtree --format=development5-subtree --format=dirstate --format=dirstate-tags --format=dirstate-with-subtree --format=knit --format=metaweave --format=pack-0.92 --format=pack-0.92-subtree --format=rich-root --format=rich-root-pack --format=weave --knit --metaweave --pack-0.92 --pack-0.92-subtree --rich-root --rich-root-pack --weave --help --no-help -h --no-tree --tree --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		case $curOpt in
			--format) optEnums=( 1.14 1.14-rich-root 1.6 1.6.1-rich-root 1.9 1.9-rich-root 2a default default-rich-root development-subtree development5-subtree dirstate dirstate-tags dirstate-with-subtree knit metaweave pack-0.92 pack-0.92-subtree rich-root rich-root-pack weave ) ;;
		esac
		;;
	init-repository|init-repo)
		cmdOpts=( --1.14 --1.14-rich-root --1.6 --1.6.1-rich-root --1.9 --1.9-rich-root --2a --default --default-rich-root --development-subtree --development5-subtree --dirstate --dirstate-tags --dirstate-with-subtree --format=1.14 --format=1.14-rich-root --format=1.6 --format=1.6.1-rich-root --format=1.9 --format=1.9-rich-root --format=2a --format=default --format=default-rich-root --format=development-subtree --format=development5-subtree --format=dirstate --format=dirstate-tags --format=dirstate-with-subtree --format=knit --format=metaweave --format=pack-0.92 --format=pack-0.92-subtree --format=rich-root --format=rich-root-pack --format=weave --knit --metaweave --pack-0.92 --pack-0.92-subtree --rich-root --rich-root-pack --weave --help --no-help -h --no-trees --trees --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		case $curOpt in
			--format) optEnums=( 1.14 1.14-rich-root 1.6 1.6.1-rich-root 1.9 1.9-rich-root 2a default default-rich-root development-subtree development5-subtree dirstate dirstate-tags dirstate-with-subtree knit metaweave pack-0.92 pack-0.92-subtree rich-root rich-root-pack weave ) ;;
		esac
		;;
	inventory)
		cmdOpts=( --help --no-help -h --kind --no-quiet --quiet -q --revision -r --no-show-ids --show-ids --no-usage --usage --no-verbose --verbose -v )
		;;
	join)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-reference --reference --no-usage --usage --no-verbose --verbose -v )
		;;
	launchpad-login|lp-login)
		# plugin "launchpad 2.4b5"
		cmdOpts=( --help --no-help -h --check --no-check --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	launchpad-mirror|lp-mirror)
		# plugin "launchpad 2.4b5"
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	launchpad-open|lp-open)
		# plugin "launchpad 2.4b5"
		cmdOpts=( --dry-run --no-dry-run --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	local-time-offset)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	log)
		cmdOpts=( --authors=all --authors=committer --authors=first --change -c --exclude-common-ancestry --no-exclude-common-ancestry --forward --no-forward --help --no-help -h --include-merges --no-include-merges --levels -n --limit -l --gnu-changelog --line --log-format=gnu-changelog --log-format=line --log-format=long --log-format=short --long --short -S --message -m --no-quiet --quiet -q --revision -r --no-show-diff --show-diff -p --no-show-ids --show-ids --no-signatures --signatures --timezone --no-usage --usage --no-verbose --verbose -v )
		case $curOpt in
			--authors) optEnums=( all committer first ) ;;
			--log-format) optEnums=( gnu-changelog line long short ) ;;
		esac
		;;
	lookup-revision)
		cmdOpts=( --directory -d --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	lp-find-proposal)
		# plugin "launchpad 2.4b5"
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --revision -r --no-usage --usage --no-verbose --verbose -v )
		;;
	lp-propose-merge|lp-submit|lp-propose)
		# plugin "launchpad 2.4b5"
		cmdOpts=( --approve --no-approve --help --no-help -h --message -m --no-quiet --quiet -q --review -R --no-staging --staging --no-usage --usage --no-verbose --verbose -v )
		;;
	ls)
		cmdOpts=( --directory -d --from-root --no-from-root --help --no-help -h --ignored --no-ignored -i --kind -k --no-null --null -0 --no-quiet --quiet -q --no-recursive --recursive -R --revision -r --no-show-ids --show-ids --no-unknown --unknown -u --no-usage --usage --no-verbose --verbose -v --no-versioned --versioned -V )
		;;
	merge)
		cmdOpts=( --change -c --directory -d --force --no-force --help --no-help -h --interactive --no-interactive -i --diff3 --lca --merge-type=diff3 --merge-type=lca --merge-type=merge3 --merge-type=weave --merge3 --weave --no-preview --preview --no-pull --pull --no-quiet --quiet -q --no-remember --remember --no-reprocess --reprocess --revision -r --no-show-base --show-base --no-uncommitted --uncommitted --no-usage --usage --no-verbose --verbose -v )
		case $curOpt in
			--merge-type) optEnums=( diff3 lca merge3 weave ) ;;
		esac
		;;
	merge-directive)
		cmdOpts=( --directory -d --help --no-help -h --mail-to --message -m --bundle --diff --plain --no-quiet --quiet -q --revision -r --no-sign --sign --no-usage --usage --no-verbose --verbose -v )
		;;
	missing)
		cmdOpts=( --directory -d --help --no-help -h --include-merges --no-include-merges --gnu-changelog --line --log-format=gnu-changelog --log-format=line --log-format=long --log-format=short --long --short -S --mine-only --no-mine-only --my-revision --no-other --other --no-quiet --quiet -q --no-reverse --reverse --revision -r --no-show-ids --show-ids --no-theirs-only --theirs-only --no-this --this --no-usage --usage --no-verbose --verbose -v )
		case $curOpt in
			--log-format) optEnums=( gnu-changelog line long short ) ;;
		esac
		;;
	mkdir)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	modified)
		cmdOpts=( --directory -d --help --no-help -h --no-null --null -0 --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	mv|move|rename)
		cmdOpts=( --after --no-after --auto --no-auto --dry-run --no-dry-run --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	nick)
		cmdOpts=( --directory -d --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	pack)
		cmdOpts=( --clean-obsolete-packs --no-clean-obsolete-packs --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	plugins)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	pull)
		cmdOpts=( --directory -d --help --no-help -h --local --no-local --no-overwrite --overwrite --no-quiet --quiet -q --no-remember --remember --revision -r --no-show-base --show-base --no-usage --usage --no-verbose --verbose -v )
		;;
	push)
		cmdOpts=( --create-prefix --no-create-prefix --directory -d --help --no-help -h --no-tree --tree --no-overwrite --overwrite --no-quiet --quiet -q --no-remember --remember --revision -r --no-stacked --stacked --stacked-on --no-strict --strict --no-usage --usage --no-use-existing-dir --use-existing-dir --no-verbose --verbose -v )
		;;
	re-sign)
		cmdOpts=( --directory -d --help --no-help -h --no-quiet --quiet -q --revision -r --no-usage --usage --no-verbose --verbose -v )
		;;
	reconcile)
		cmdOpts=( --canonicalize-chks --no-canonicalize-chks --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	reconfigure)
		cmdOpts=( --bind-to --force --no-force --help --no-help -h --no-quiet --quiet -q --stacked-on --branch --checkout --lightweight-checkout --standalone --tree --use-shared --with-no-trees --with-trees --no-unstacked --unstacked --no-usage --usage --no-verbose --verbose -v )
		;;
	reference)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	register-branch)
		# plugin "launchpad 2.4b5"
		cmdOpts=( --author --branch-description --branch-name --branch-title --dry-run --no-dry-run --help --no-help -h --link-bug --product --project --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	relpath)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	remerge)
		cmdOpts=( --help --no-help -h --diff3 --lca --merge-type=diff3 --merge-type=lca --merge-type=merge3 --merge-type=weave --merge3 --weave --no-quiet --quiet -q --no-reprocess --reprocess --no-show-base --show-base --no-usage --usage --no-verbose --verbose -v )
		case $curOpt in
			--merge-type) optEnums=( diff3 lca merge3 weave ) ;;
		esac
		;;
	remove|rm|del)
		cmdOpts=( --force --keep --no-backup --safe --help --no-help -h --new --no-new --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	remove-branch|rmbranch)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	remove-tree)
		cmdOpts=( --force --no-force --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	renames)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	repair-workingtree)
		cmdOpts=( --directory -d --force --no-force --help --no-help -h --no-quiet --quiet -q --revision -r --no-usage --usage --no-verbose --verbose -v )
		;;
	resolve|resolved)
		cmdOpts=( --action=done --action=take-other --action=take-this --done --take-other --take-this --all --no-all --directory -d --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		case $curOpt in
			--action) optEnums=( done take-other take-this ) ;;
		esac
		;;
	revert)
		cmdOpts=( --forget-merges --no-forget-merges --help --no-help -h --backup --no-backup --no-quiet --quiet -q --revision -r --no-usage --usage --no-verbose --verbose -v )
		;;
	revision-history)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	revision-info)
		cmdOpts=( --directory -d --help --no-help -h --no-quiet --quiet -q --revision -r --no-tree --tree --no-usage --usage --no-verbose --verbose -v )
		;;
	revno)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-tree --tree --no-usage --usage --no-verbose --verbose -v )
		;;
	rocks)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	root)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	selftest)
		# ERROR getting registry keys for '--parallel': No module named testtools
		cmdOpts=( --benchmark --no-benchmark --debugflag -E --exclude -x --first --no-first -f --help --no-help -h --list-only --no-list-only --load-list --lsprof-tests --no-lsprof-tests --lsprof-timed --no-lsprof-timed --no-one --one -1 --parallel --no-quiet --quiet -q --randomize --starting-with -s --no-strict --strict --no-subunit --subunit --transport --no-usage --usage --no-verbose --verbose -v )
		;;
	send)
		cmdOpts=( --body --format=0.9 --format=4 --from -f --help --no-help -h --mail-to --message -m --bundle --no-bundle --no-patch --patch --output -o --no-quiet --quiet -q --no-remember --remember --revision -r --no-strict --strict --no-usage --usage --no-verbose --verbose -v )
		case $curOpt in
			--format) optEnums=( 0.9 4 ) ;;
		esac
		;;
	serve|server)
		cmdOpts=( --allow-writes --no-allow-writes --directory -d --help --no-help -h --inet --no-inet --port --bzr --protocol=bzr --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		case $curOpt in
			--protocol) optEnums=( bzr ) ;;
		esac
		;;
	shell-complete|s-c)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	shelve)
		cmdOpts=( --all --no-all --destroy --no-destroy --directory -d --help --no-help -h --list --no-list --message -m --no-quiet --quiet -q --revision -r --no-usage --usage --no-verbose --verbose -v --plain )
		;;
	sign-my-commits)
		cmdOpts=( --dry-run --no-dry-run --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	split)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	status|st|stat)
		cmdOpts=( --change -c --help --no-help -h --classify --no-classify --no-pending --pending --no-quiet --quiet -q --revision -r --no-short --short -S --no-show-ids --show-ids --no-usage --usage --no-verbose --verbose -v --no-versioned --versioned -V )
		;;
	switch)
		cmdOpts=( --create-branch --no-create-branch -b --directory -d --force --no-force --help --no-help -h --no-quiet --quiet -q --revision -r --no-usage --usage --no-verbose --verbose -v )
		;;
	tag)
		cmdOpts=( --delete --no-delete --directory -d --force --no-force --help --no-help -h --no-quiet --quiet -q --revision -r --no-usage --usage --no-verbose --verbose -v )
		;;
	tags)
		cmdOpts=( --directory -d --help --no-help -h --no-quiet --quiet -q --revision -r --no-show-ids --show-ids --sort=alpha --sort=natural --sort=time --no-usage --usage --no-verbose --verbose -v )
		case $curOpt in
			--sort) optEnums=( alpha natural time ) ;;
		esac
		;;
	test-script)
		cmdOpts=( --help --no-help -h --no-null-output --null-output --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	testament)
		cmdOpts=( --help --no-help -h --long --no-long --no-quiet --quiet -q --revision -r --no-strict --strict --no-usage --usage --no-verbose --verbose -v )
		;;
	touching-revisions)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	unbind)
		cmdOpts=( --directory -d --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	uncommit)
		cmdOpts=( --dry-run --no-dry-run --force --no-force --help --no-help -h --local --no-local --no-quiet --quiet -q --revision -r --no-usage --usage --no-verbose --verbose -v )
		;;
	unknowns)
		cmdOpts=( --directory -d --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	unshelve)
		cmdOpts=( --apply --delete-only --dry-run --keep --preview --directory -d --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	update|up)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --revision -r --no-show-base --show-base --no-usage --usage --no-verbose --verbose -v )
		;;
	upgrade)
		cmdOpts=( --clean --no-clean --dry-run --no-dry-run --1.14 --1.14-rich-root --1.6 --1.6.1-rich-root --1.9 --1.9-rich-root --2a --default --default-rich-root --development-subtree --development5-subtree --dirstate --dirstate-tags --dirstate-with-subtree --format=1.14 --format=1.14-rich-root --format=1.6 --format=1.6.1-rich-root --format=1.9 --format=1.9-rich-root --format=2a --format=default --format=default-rich-root --format=development-subtree --format=development5-subtree --format=dirstate --format=dirstate-tags --format=dirstate-with-subtree --format=knit --format=metaweave --format=pack-0.92 --format=pack-0.92-subtree --format=rich-root --format=rich-root-pack --format=weave --knit --metaweave --pack-0.92 --pack-0.92-subtree --rich-root --rich-root-pack --weave --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		case $curOpt in
			--format) optEnums=( 1.14 1.14-rich-root 1.6 1.6.1-rich-root 1.9 1.9-rich-root 2a default default-rich-root development-subtree development5-subtree dirstate dirstate-tags dirstate-with-subtree knit metaweave pack-0.92 pack-0.92-subtree rich-root rich-root-pack weave ) ;;
		esac
		;;
	verify-signatures)
		cmdOpts=( --acceptable-keys -k --help --no-help -h --no-quiet --quiet -q --revision -r --no-usage --usage --no-verbose --verbose -v )
		;;
	version)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-short --short --no-usage --usage --no-verbose --verbose -v )
		;;
	version-info)
		cmdOpts=( --all --no-all --check-clean --no-check-clean --custom --format=custom --format=python --format=rio --python --rio --help --no-help -h --include-file-revisions --no-include-file-revisions --include-history --no-include-history --no-quiet --quiet -q --template --no-usage --usage --no-verbose --verbose -v )
		case $curOpt in
			--format) optEnums=( custom python rio ) ;;
		esac
		;;
	view)
		cmdOpts=( --all --no-all --delete --no-delete --help --no-help -h --name --no-quiet --quiet -q --switch --no-usage --usage --no-verbose --verbose -v )
		;;
	wait-until-signalled)
		cmdOpts=( --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	whoami)
		cmdOpts=( --branch --no-branch --directory -d --email --no-email --help --no-help -h --no-quiet --quiet -q --no-usage --usage --no-verbose --verbose -v )
		;;
	*)
		cmdOpts=(--help -h)
		;;
	esac

	IFS=$'\n'
	if [[ ${#fixedWords[@]} -eq 0 ]] && [[ ${#optEnums[@]} -eq 0 ]] && [[ $cur != -* ]]; then
		case $curOpt in
			tag:|*..tag:)
				fixedWords=( $(bzr tags 2>/dev/null | sed 's/  *[^ ]*$//; s/ /\\\\ /g;') )
				;;
		esac
		case $cur in
			[\"\']tag:*)
				fixedWords=( $(bzr tags 2>/dev/null | sed 's/  *[^ ]*$//; s/^/tag:/') )
				;;
			[\"\']*..tag:*)
				fixedWords=( $(bzr tags 2>/dev/null | sed 's/  *[^ ]*$//') )
				fixedWords=( $(for i in "${fixedWords[@]}"; do echo "${cur%..tag:*}..tag:${i}"; done) )
				;;
		esac
	elif [[ $cur == = ]] && [[ ${#optEnums[@]} -gt 0 ]]; then
		# complete directly after "--option=", list all enum values
		COMPREPLY=( "${optEnums[@]}" )
		return 0
	else
		fixedWords=( "${cmdOpts[@]}"
		             "${globalOpts[@]}"
		             "${optEnums[@]}"
		             "${fixedWords[@]}" )
	fi

	if [[ ${#fixedWords[@]} -gt 0 ]]; then
		COMPREPLY=( $( compgen -W "${fixedWords[*]}" -- $cur ) )
	fi

	return 0
}

complete -F _bzr -o default bzr
