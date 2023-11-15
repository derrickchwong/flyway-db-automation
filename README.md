### Flyway on Kubernetes for Database Migrations

This repo demostrate the use of flyway on a kubernetes cluster.

You will need to create a `flyway.conf` on the `k8s` folder, you can copy the `flyway.conf.sample`

To run it, run 

```
kubectl apply -k . 
```

It will create a k8s job for Flyway and apply the sql files.   
