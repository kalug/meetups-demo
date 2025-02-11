

```
kubectl apply -k
```


```
kubectl kustomize
```



```
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
- {pathOrUrl}
- ...

generators:
- {pathOrUrl}
- ...

transformers:
- {pathOrUrl}
- ...

validators:
- {pathOrUrl}
- ...
```

https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/

- Generating Resources
  - configMapGenerator
    - env
    - properties
  - secretGenerator
  - generatorOptions
