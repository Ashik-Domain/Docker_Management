show_main_menu() {
  echo "Docker Management Menu"
  echo "1. See Docker Images"
  echo "2. See Running Containers"
  echo "3. See Background Containers"
  echo "4. Exit"
  read -p "Enter your choice: " choice
}

show_image_menu() {
  echo "Image Management Menu"
  echo "1. Delete Image"
  echo "2. Run Image"
  echo "3. Go to Main Menu"
  echo "4. Exit"
  read -p "Enter your choice: " choice
}


show_container_menu() {
  echo "Container Management Menu"
  echo "1. Stop Container"
  echo "2. Delete Container"
  echo "3. Run Container"
  echo "4. Go to Main Menu"
  echo "5. Exit"
  read -p "Enter your choice: " choice
}


while true; do
  show_main_menu

  case $choice in
    1)
      echo "Listing Docker Images:"
      docker images
      show_image_menu
      case $choice in
        1)
          read -p "Enter Image ID or Image Name to delete: " image_id_or_name
          docker image rm $image_id_or_name
          ;;
        2)
          read -p "Enter Image ID or Image Name to run: " image_id_or_name
          read -p "Enter a name for the container (optional): " container_name
          if [ -z "$container_name" ]; then
            docker run -d $image_id_or_name
          else
            docker run -d --name $container_name $image_id_or_name
          fi
          ;;
        3)
          continue  
          ;;
        4)
          exit 0
          ;;
        *)
          echo "Invalid choice."
          ;;
      esac
      ;;
    2)
      echo "Listing Running Containers:"
      docker ps
      show_container_menu
      case $choice in
        1)
          read -p "Enter Container ID or Container Name to stop: " container_id_or_name
          docker stop $container_id_or_name
          ;;
        2)
          read -p "Enter Container ID or Container Name to delete: " container_id_or_name
          docker rm $container_id_or_name
          ;;
        3)
          read -p "Enter Image ID or Image Name to run: " image_id_or_name
          read -p "Enter a name for the container (optional): " container_name
          if [ -z "$container_name" ]; then
            docker run -d $image_id_or_name
          else
            docker run -d --name $container_name $image_id_or_name
          fi
          ;;
        4)
          continue 
          ;;
        5)
          exit 0  
          ;;
        *)
          echo "Invalid choice."
          ;;
      esac
      ;;
    3)
      echo "Listing Background Containers:"
      docker ps -a
      show_container_menu
      case $choice in
        1)
          read -p "Enter Container ID or Container Name to stop: " container_id_or_name
          docker stop $container_id_or_name
          ;;
        2)
          read -p "Enter Container ID or Container Name to delete: " container_id_or_name
          docker rm $container_id_or_name
          ;;
        3)
          read -p "Enter Image ID or Image Name to run: " image_id_or_name
          read -p "Enter a name for the container (optional): " container_name
          if [ -z "$container_name" ]; then
            docker run -d $image_id_or_name
          else
            docker run -d --name $container_name $image_id_or_name
          fi
          ;;
        4)
          continue 
          ;;
        5)
          exit 0  
          ;;
        *)
          echo "Invalid choice."
          ;;
      esac
      ;;
    4)
      echo "Exiting..."
      exit 0
      ;;
    *)
      echo "Invalid choice."
      ;;
  esac
done

