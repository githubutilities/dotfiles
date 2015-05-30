ALFRED_WORKFLOW_MANAGER=alfred-workflow-manager
ALFRED_WORKFLOW_MANAGER_GIT_REPOSITORY=git@github.com:githubutilities/$ALFRED_WORKFLOW_MANAGER.git
WORKFLOW_DIRECTORY=~/Library/"Application Support"/"Alfred 2"/Alfred.alfredpreferences/workflows/

cd "${WORKFLOW_DIRECTORY}"
if [ ! -d ALFRED_WORKFLOW_MANAGER ]; then
	git clone $ALFRED_WORKFLOW_MANAGER_GIT_REPOSITORY;
else
	echo "Workflow manager already installed.";
fi;

unset ALFRED_WORKFLOW_MANAGER;
unset ALFRED_WORKFLOW_MANAGER_GIT_REPOSITORY;
unset WORKFLOW_DIRECTORY;
