@Library('my-maven-library')_

pipeline{




    agent any




     tools   {

                jdk 'jdk'

                 maven 'Maven' 

              }  

   

    environment {

                image_built=''

                image_tag='deekshaaa/hello-world:1.0'

                dockerhub=credentials('dockerhub')

                  } 

    

    stages{

        stage('Build')

          {   

            steps {

                     mavenBuild()

                  }

           }

       

        // stage('test')

        //   {

        //     steps

        //         {

        //            runTests()

        //         }

        //    }   

  

        stage('"Packaging, pushing to DockerHub')

        {

             when  {

                     branch "main"

                   }

            stages

            {  

                stage("Packaging the application into executable jar")

                

                  {   

                    steps

                        {

                          mavenPackage()

                        }

                   }

                

                stage("Building the docker image")

                 {




                   steps

                        {

                          sh 'docker build -t hello-world:1.0 .  '
                          sh 'docker tag hello-world:1.0 deekshaaa/my-hello-world:1.0'

                         }

                 } 

                

                // stage("Login into docker hub") {




            // steps {

            //     sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'

            // }

        // }

                stage("Push the Image to DockerHub")

                {

                    steps

                         {

                sh 'docker push deekshaaa/my-hello-world:1.0'
                
                }

                           

                 }

           }

        } 

     }
}
