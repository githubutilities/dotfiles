ALFRED_WORKFLOW_MANAGER=alfred-workflow-manager
ALFRED_WORKFLOW_MANAGER_GIT_REPOSITORY=https://github.com/githubutilities/alfred-workflow-manager.git
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
