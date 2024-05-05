document.addEventListener("DOMContentLoaded", function () {
    const config = {
        checkboxMode: 'all',  // Vaihda tämä 'all', 'leaf' tai 'none' riippuen tarpeestasi
        useIcons: false         // Tämän asetuksen voi asettaa 'true' tai 'false'
    };

    const data = {
        "name": "Root Node",
        "children": [
            {
                "name": "Child Node 1",
                "children": []
            },
            {
                "name": "Child Node 2",
                "children": [
                    {
                        "name": "Grandchild Node 1",
                        "children": []
                    }
                ]
            }
        ]
    };

    const svgIcon = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M 22 18 V 10 a 2 2 0 0 0 -2 -2 h -7 c -2 0 -1 -2 -3 -2 H 4 a 2 2 0 0 0 -2 2 v 10 a 2 2 0 0 0 2 2 h 16 a 2 2 0 0 0 2 -2 z"/></svg>`;
    const svgToggle = `<svg class="toggle" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>`;

    function createNode(nodeData) {
        const nodeElement = document.createElement('div');
        nodeElement.className = 'node';

        if (nodeData.children && nodeData.children.length > 0) {
            const toggle = document.createElement('div');
            toggle.innerHTML = svgToggle;
            toggle.classList.add('toggle');
            nodeElement.appendChild(toggle);

            toggle.addEventListener('click', function () {
                this.classList.toggle('rotated');
                childrenContainer.classList.toggle('visible');
            });
        }

        if (config.useIcons) {
            const icon = document.createElement('div');
            icon.innerHTML = svgIcon;
            icon.classList.add('icon');
            nodeElement.appendChild(icon);
        }

        const shouldIncludeCheckbox = (config.checkboxMode === 'all') ||
                                      (config.checkboxMode === 'leaf' && (!nodeData.children || nodeData.children.length === 0));
        if (shouldIncludeCheckbox) {
            const checkbox = document.createElement('input');
            checkbox.type = 'checkbox';
            nodeElement.appendChild(checkbox);
        }

        const text = document.createElement('span');
        text.textContent = nodeData.name;
        nodeElement.appendChild(text);

        let childrenContainer;
        if (nodeData.children && nodeData.children.length > 0) {
            childrenContainer = document.createElement('div');
            childrenContainer.className = 'children';
            nodeData.children.forEach(child => childrenContainer.appendChild(createNode(child)));
            nodeElement.appendChild(childrenContainer);
        }

        return nodeElement;
    }

    function renderTree() {
        const treeContainer = document.getElementById('tree');
        treeContainer.innerHTML = ''; // Clear the container
        treeContainer.appendChild(createNode(data));
    }

    // Initial render
    renderTree();
});
