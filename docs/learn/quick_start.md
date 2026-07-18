# quickstart

this will bring you from installing signalis for the first time to building games or other projects with it

## installation

signalis is one file available at [`src/init.luau`](https://github.com/luau-ecs/signalis/blob/master/src/init.luau).

if using roblox studio, prebuilt `.rbxm` files are available in signalis'
<a href="https://github.com/luau-ecs/signalis/releases" target="_blank">github releases</a>.

it can also be added with your package manager of choice:
<details>
<summary><a href="https://wally.run/package/luau-ecs/signalis" target="_blank">wally (not published yet)</a></summary>

```
wally add luau-ecs/signalis
wally install
```

</details>
<details>
<summary><a href="https://pesde.dev/packages/luau-ecs/signalis/versions" target="_blank">pesde (not published yet)</a></summary>

```
pesde add luau-ecs/signalis
pesde install
```

</details>
<details>
<summary><a href="https://www.npmjs.com/package/@rbxts/signalis?activeTab=versions" target="_blank">npm (not published yet)</a></summary>

```
npm i @rbxts/signalis
```

</details>

## 

to get started, you need to create an ecs object. it stores all of your entities and their members, allows you to query
for state, and more. usually, a single world is created and returned in a module, but there is no limit to how many ecs
objects you can create.

```luau
local onto = require(path.to.onto)
local ecs = onto.ecs()

return ecs
```

## signals

todo
